import 'package:flutter/material.dart';
import 'package:personality_test_app/core/domin/questions/questions_repository_provider.dart';
import 'package:personality_test_app/core/models/question_model.dart';
import 'package:personality_test_app/core/view_models/base/base_view_models.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel({
    required QuestionsRepositoryProvider questionsRepositoryProvider,
    // required SelectedQuestionIndexProvider selectedQuestionIndexProvider
  }) :
        _questionsRepositoryProvider = questionsRepositoryProvider; //,
        // _selectedQuestionIndexProvider = selectedQuestionIndexProvider;

  final QuestionsRepositoryProvider _questionsRepositoryProvider;
  // final SelectedQuestionIndexProvider _selectedQuestionIndexProvider;

  List<QuestionModel>? get questions => _questionsRepositoryProvider.questions;

  Future<bool> refresh() async {
    setBusy(true);
    final success = await _questionsRepositoryProvider.fetchQuestions();
    setBusy(false);
    return success;
  }

  // Selected Question Index Provider
  int _selectedQuestionIndex = 0 ;
  int get getSelectedQuestionIndex => _selectedQuestionIndex;
  void setSelectedQuestionIndex(int index) {
    _selectedQuestionIndex = index;
    notifyListeners();
  }
  // Selected Answer Index Provider
  int _selectedAnswerIndex = 0 ;
  int get getSelectedAnswerIndex => _selectedAnswerIndex;
  void setSelectedAnswerIndex(int index) {
    _selectedAnswerIndex = index;
    notifyListeners();
  }
}
