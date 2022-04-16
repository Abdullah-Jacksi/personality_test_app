import 'package:flutter/widgets.dart';
import 'package:personality_test_app/core/constants/routes.dart';
import 'package:personality_test_app/ui/views/home/home_view.dart';
import 'package:personality_test_app/ui/views/result/result_view.dart';
import 'package:personality_test_app/ui/views/splash/splash_view.dart';

class AppRouter {
  static dynamic routes() => {
    RoutePaths.splash: (BuildContext context) => SplashView(),
    RoutePaths.home: (BuildContext context) => HomeView(),
    RoutePaths.result: (BuildContext context) => ResultView(),
  };
}