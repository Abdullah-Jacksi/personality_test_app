import 'dart:developer';

import 'package:personality_test_app/core/data/questions/questions_repository.dart';
import 'package:personality_test_app/core/models/question_model.dart';

class MockQuestionsRepository extends QuestionsRepository {

  @override
  Future<List<QuestionModel>?> fetchQuestions() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      return mockData;
    } catch (error) {
      log(error.toString());
    }
    return null;
  }

  List<QuestionModel>? mockData = [
    QuestionModel(
        question:
            'You’re really busy at work and a colleague is telling you their life story and personal woes. You:',
        answers: [
          "Don’t dare to interrupt them",
          "Think it’s more important to give them some of your time; work can wait",
          "Listen, but with only with half an ear",
          "Interrupt and explain that you are really busy at the moment"
        ]),
    QuestionModel(
        question:
            'You’ve been sitting in the doctor’s waiting room for more than 25 minutes. You:',
        answers: [
          "Look at your watch every two minutes",
          "Bubble with inner anger, but keep quiet",
          "Explain to other equally impatient people in the room that the doctor is always running late",
          "Complain in a loud voice, while tapping your foot impatiently"
        ]),
    QuestionModel(
        question:
            'You’re having an animated discussion with a colleague regarding a project that you’re in charge of. You:',
        answers: [
          "Don’t dare contradict them",
          "Think that they are obviously right",
          "Defend your own point of view, tooth and nail",
          "Continuously interrupt your colleague"
        ]),
    QuestionModel(
        question: 'You are taking part in a guided tour of a museum. You:',
        answers: [
          "Are a bit too far towards the back so don’t really hear what the guide is saying",
          "Follow the group without question",
          "Make sure that everyone is able to hear properly",
          "Are right up the front, adding your own comments in a loud voice"
        ]),
    QuestionModel(
        question:
            'During dinner parties at your home, you have a hard time with people who:',
        answers: [
          "Ask you to tell a story in front of everyone else",
          "Talk privately between themselves",
          "Hang around you all evening",
          "Always drag the conversation back to themselves"
        ]),
  ];
}
