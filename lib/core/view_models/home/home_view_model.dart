import 'package:flutter/material.dart';
import 'package:personality_test_app/core/constants/routes.dart';
import 'package:personality_test_app/core/domin/questions/questions_repository_provider.dart';
import 'package:personality_test_app/core/models/question_model.dart';
import 'package:personality_test_app/core/view_models/base/base_view_models.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel({
    required QuestionsRepositoryProvider questionsRepositoryProvider,
  }) : _questionsRepositoryProvider = questionsRepositoryProvider; //,

  final QuestionsRepositoryProvider _questionsRepositoryProvider;

  List<QuestionModel>? get questions => _questionsRepositoryProvider.questions;

  Future<bool> refresh() async {
    setBusy(true);
    notifyListeners();
    final success = await _questionsRepositoryProvider.fetchQuestions();
    setBusy(false);
    notifyListeners();
    return success;
  }

  List<int> cacheAnswersList = [];

  void initialCacheAnswersList() {
    cacheAnswersList = [];
    if (questions != null) {
      for (int i = 0; i < questions!.length; i++) {
        cacheAnswersList.add(-1);
      }
    }
  }

  bool checkIfLastQuestion() {
    if ((getSelectedQuestionIndex + 1) == questions?.length) {
      return true;
    } else {
      return false;
    }
  }

  bool checkIfNotSelectedAnswer() {
    if (getSelectedAnswerIndex == -1) {
      return true;
    } else {
      return false;
    }
  }

  void goToNextQuestion(BuildContext context) {
    if ((getSelectedQuestionIndex + 1) == questions?.length) {
      cacheAnswersList[getSelectedQuestionIndex] = getSelectedAnswerIndex;
      getResultScore();
      goTo(context, path: RoutePaths.result);
    } else {
      cacheAnswersList[getSelectedQuestionIndex] = getSelectedAnswerIndex;
      if (cacheAnswersList[getSelectedQuestionIndex + 1] != -1) {
        setSelectedAnswerIndex(cacheAnswersList[getSelectedQuestionIndex + 1]);
      } else {
        setSelectedAnswerIndex(-1);
      }
      setSelectedQuestionIndex(getSelectedQuestionIndex + 1);
    }
  }

  void goToPreviousQuestion() {
    if (getSelectedQuestionIndex > 0) {
      setSelectedQuestionIndex(getSelectedQuestionIndex - 1);
      setSelectedAnswerIndex(cacheAnswersList[getSelectedQuestionIndex]);
    }
  }

  int getResultScore() {
    int res = 0;
    for (int i = 0; i < cacheAnswersList.length; i++) {
      res += cacheAnswersList[i];
    }
    return res;
  }

  // Selected Question Index Provider
  int _selectedQuestionIndex = 0;

  int get getSelectedQuestionIndex => _selectedQuestionIndex;

  void setSelectedQuestionIndex(int index) {
    _selectedQuestionIndex = index;
    notifyListeners();
  }

  // Selected Answer Index Provider
  int _selectedAnswerIndex = -1;

  int get getSelectedAnswerIndex => _selectedAnswerIndex;

  void setSelectedAnswerIndex(int index) {
    _selectedAnswerIndex = index;
    notifyListeners();
  }
}
