import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/review.dart';
import '../../utils/export_utils.dart';
import 'response/customer_review_response.dart';
import 'response/restaurant_response.dart';
import 'response/restaurants_response.dart';

part 'api_services.g.dart';

@injectable
@RestApi(baseUrl: Const.baseUrl)
abstract class ApiServices {
  @factoryMethod
  factory ApiServices(Dio dio) = _ApiServices;

  @GET('/list')
  Future<RestaurantsResponse> getRestaurants();

  // @GET('/list')
  // Future<List<Restaurant>> getRestaurants2();

  // @GET('/list')
  // Future<BaseResult<List<Restaurant>>> getRestaurants3();

  @GET('/detail/{id}')
  Future<RestaurantResponse> getRestaurant(@Path('id') String id);

  @GET('/search')
  Future<RestaurantsResponse> searchRestaurants(@Query('q') String query);

  @POST('/review')
  Future<CustomerReviewResponse> postReview(
    @Body() Review review,
  );
}
