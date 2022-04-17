import 'dart:developer';
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
    final success = await _questionsRepositoryProvider.fetchQuestions();
    setBusy(false);
    return success;
  }

  List<int> cacheAnswersList = [];
  void initialCacheAnswersList(){
    for(int i = 0 ; i < questions!.length ; i++){
      cacheAnswersList.add(-1);
    }
  }

  void nextQuestion(BuildContext context) {
    if ((getSelectedQuestionIndex + 1) == questions!.length) {
      showResult(context);
    } else {
      cacheAnswersList[getSelectedQuestionIndex] = getSelectedAnswerIndex;
      if(cacheAnswersList[getSelectedQuestionIndex + 1] != -1){
        setSelectedAnswerIndex(cacheAnswersList[getSelectedQuestionIndex + 1]);
      }else{
        setSelectedAnswerIndex(-1);
      }
      setSelectedQuestionIndex(getSelectedQuestionIndex + 1);
    }
  }

  void previousQuestion() {
    if (getSelectedQuestionIndex > 0) {
      setSelectedQuestionIndex(getSelectedQuestionIndex - 1);
      setSelectedAnswerIndex(cacheAnswersList[getSelectedQuestionIndex]);
    }
  }

  void showResult(BuildContext context) {
    goTo(context, path: RoutePaths.result);
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
