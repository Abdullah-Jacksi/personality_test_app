
import 'package:personality_test_app/core/data/questions/questions_repository.dart';
import 'package:personality_test_app/core/models/question_model.dart';

class APIQuestionsRepository extends QuestionsRepository{
  @override
  Future<List<QuestionModel>?> getQuestions() async {
    return null;
  }
}