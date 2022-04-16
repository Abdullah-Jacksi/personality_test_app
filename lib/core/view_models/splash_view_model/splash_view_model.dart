import 'package:flutter/material.dart';
import 'package:personality_test_app/core/constants/routes.dart';
import 'package:personality_test_app/core/domin/questions/questions_repository_provider.dart';
import 'package:personality_test_app/core/view_models/base/base_view_models.dart';

class SplashViewModel extends BaseViewModel {
  SplashViewModel({
    required QuestionsRepositoryProvider questionsRepositoryProvider,
  }) : _questionsRepositoryProvider = questionsRepositoryProvider;

  final QuestionsRepositoryProvider _questionsRepositoryProvider;

  Future<void> onReady(BuildContext context) async {
    setBusy(true);
    await _questionsRepositoryProvider.fetchQuestions();
    setBusy(false);
    goTo(context, path: RoutePaths.home, pushAndReplace: true);
  }
}
