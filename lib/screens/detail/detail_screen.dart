import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/app_list.dart';
import '../../di/injection.dart';
import '../../models/restaurant.dart';
import '../../repository/restaurant_repository.dart';
import '../../res/app_textstyle.dart';
import '../../utils/app_context.dart';
import 'components/detail_contents.dart';
import 'components/preview_review.dart';
import 'components/recomendations.dart';
import 'cubit/detail_cubit.dart';

class DetailScreen extends StatefulWidget {
  final Restaurant restaurant;
  const DetailScreen({super.key, required this.restaurant});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late final DetailCubit _detailCubit;
  final ScrollController _scrollController = ScrollController();
  bool isError = false;

  @override
  void initState() {
    _detailCubit =
        getIt.registerSingleton(DetailCubit(getIt<RestaurantRepository>()));
    _detailCubit.init(widget.restaurant);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isError
          ? AppBar(
              title: Text(widget.restaurant.name),
            )
          : null,
      body: BlocConsumer<DetailCubit, DetailState>(
        bloc: _detailCubit,
        listener: (context, state) {
          if (state.isError) {
            setState(() {
              isError = true;
            });
            context.snackbar.showSnackBar(SnackBar(
              content: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ));
          }
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.isError) {
            return Center(
              child: Text(
                'Cant load data.',
                style: AppTextStyle.medium,
              ),
            );
          }
          return NestedScrollView(
              controller: _scrollController,
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverAppBar(
                      expandedHeight: 250,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        title: Text(
                          _isSliverAppBarExpanded
                              ? "${state.restaurant.name} Detail"
                              : "",
                          style: const TextStyle(color: Colors.black),
                        ),
                        background: Image.network(state.restaurant.image,
                            fit: BoxFit.fill),
                      ),
                    )
                  ],
              body: AppList(_contents(state),
                  isSeparated: true,
                  itemBuilder: (context, widget, index) => widget,
                  separatorBuilder: (context, item, index) {
                    if (index == 0) {
                      return Container();
                    }
                    return const Divider(
                      thickness: 2.5,
                    );
                  }));
        },
      ),
    );
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (250 - kToolbarHeight);
  }

  List<Widget> _contents(DetailState state) => [
        Container(
          width: context.mediaSize.width,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Text(
                state.restaurant.name,
                style: AppTextStyle.title,
                textAlign: TextAlign.center,
              ),
              Text(
                state.restaurant.categoriesString,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
        DetailContents(restaurant: state.restaurant),
        state.restaurant.customerReviews.isNotEmpty
            ? PreviewReview(
                reviews: state.restaurant.customerReviews,
                title: state.restaurant.name,
              )
            : Container(),
        Recomendations(state.recomendations)
      ];

  @override
  void dispose() {
    _detailCubit.close();
    getIt.unregister<DetailCubit>();
    super.dispose();
  }
}
