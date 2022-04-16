import 'package:flutter/material.dart';
import 'package:personality_test_app/config/router_config.dart';
import 'package:personality_test_app/core/constants/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personality Test',
      debugShowCheckedModeBanner: false,
      initialRoute: RoutePaths.splash,
      routes: AppRouter.routes(),
    );
  }
}
