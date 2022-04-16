import 'package:flutter/material.dart';
import 'package:personality_test_app/core/data/questions/mock_questions_repository.dart';
import 'package:personality_test_app/core/models/question_model.dart';

class QuestionsRepositoryProvider with ChangeNotifier {
  final MockQuestionsRepository _mockQuestionsRepository = MockQuestionsRepository();

  List<QuestionModel>? _questions;

  List<QuestionModel>? get questions => _questions;

  Future<bool> fetchQuestions() async {
    final apiResponse = await _mockQuestionsRepository.fetchQuestions();
    if (apiResponse != null) {
      _questions = apiResponse;
      notifyListeners();
      return true;
    }
    return false;
  }

}