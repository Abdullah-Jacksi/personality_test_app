import 'package:flutter/material.dart';
import 'package:personality_test_app/core/data/questions/local_questions_repository.dart';
import 'package:personality_test_app/core/models/question_model.dart';

class QuestionsRepositoryProvider with ChangeNotifier {
  QuestionsRepositoryProvider({required LocalQuestionsRepository localQuestionsRepository})
      : _localQuestionsRepository = localQuestionsRepository;

  final LocalQuestionsRepository _localQuestionsRepository;

  List<QuestionModel>? _questions = [];

  List<QuestionModel>? get questions => _questions;

  Future<bool> fetchQuestions() async {
    final apiResponse = await _localQuestionsRepository.fetchQuestions();
    if (apiResponse != null) {
      _questions = apiResponse;
      notifyListeners();
      return true;
    }
    return false;
  }
}
