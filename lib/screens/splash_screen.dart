import 'package:flutter/material.dart';

import '../res/app_textstyle.dart';
import '../utils/app_route.dart';
import 'home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      AppRoute.clearAll(const HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        'D\'RESTO',
        style: AppTextStyle.title.copyWith(fontSize: 40),
      ),
    ));
  }
}
