import 'package:flutter/material.dart';
import 'package:personality_test_app/config/router_config.dart';
import 'package:personality_test_app/core/constants/routes.dart';
import 'package:personality_test_app/core/domin/questions/questions_repository_provider.dart';
import 'package:personality_test_app/core/view_models/home/home_view_model.dart';
import 'package:personality_test_app/core/view_models/result/result_view_model.dart';
import 'package:personality_test_app/core/view_models/splash_view_model/splash_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => QuestionsRepositoryProvider(),
        child: Consumer<QuestionsRepositoryProvider>(
            builder: (context, questionsRepositoryProvider, child) {
          return MultiProvider(
              providers: [
                ChangeNotifierProvider(
                    create: (BuildContext context) => SplashViewModel(
                        questionsRepositoryProvider:
                            questionsRepositoryProvider)),
                ChangeNotifierProvider(
                    create: (BuildContext context) => HomeViewModel(
                        questionsRepositoryProvider:
                            questionsRepositoryProvider)),
                ChangeNotifierProxyProvider<HomeViewModel, ResultViewModel>(
                    create: (context) => ResultViewModel(
                        homeViewModel:
                            Provider.of<HomeViewModel>(context, listen: false)),
                    update: (context, homeViewModel, resultViewModel) {
                      return ResultViewModel(homeViewModel: homeViewModel);
                    }),
              ],
              child: MaterialApp(
                title: 'Personality Test',
                debugShowCheckedModeBanner: false,
                initialRoute: RoutePaths.splash,
                routes: AppRouter.routes(),
              ));
        }));
  }
}
