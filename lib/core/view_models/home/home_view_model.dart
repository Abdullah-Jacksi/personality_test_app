import 'package:flutter/material.dart';
import 'package:personality_test_app/core/domin/questions/questions_repository_provider.dart';
import 'package:personality_test_app/core/models/question_model.dart';
import 'package:personality_test_app/core/view_models/base/base_view_models.dart';

class HomeViewModel extends BaseViewModel {

  HomeViewModel({
    required QuestionsRepositoryProvider questionsRepositoryProvider,
  }) : _questionsRepositoryProvider = questionsRepositoryProvider;

  final QuestionsRepositoryProvider _questionsRepositoryProvider;

  List<QuestionModel>? get getQuestions => _questionsRepositoryProvider.questions;


  Future<bool> refresh() async {
    setBusy(true);
    final success = await _questionsRepositoryProvider.fetchQuestions();
    setBusy(false);
    return success;
  }
}
