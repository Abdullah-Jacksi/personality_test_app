
import 'package:personality_test_app/core/models/question_model.dart';

abstract class QuestionsRepository {

  Future<List<QuestionModel>?> getQuestions();
}



