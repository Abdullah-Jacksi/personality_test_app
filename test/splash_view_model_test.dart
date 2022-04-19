import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:personality_test_app/core/data/questions/local_questions_repository.dart';
import 'package:personality_test_app/core/data/questions/questions_repository.dart';
import 'package:personality_test_app/core/domain/questions/questions_repository_provider.dart';
import 'package:personality_test_app/core/models/question_model.dart';
import 'package:personality_test_app/core/view_models/home/home_view_model.dart';
import 'package:personality_test_app/core/view_models/splash_view_model/splash_view_model.dart';

class MockLocalQuestionsRepository extends Mock implements LocalQuestionsRepository{}




void main() {
  late SplashViewModel splashViewModel;
  late QuestionsRepositoryProvider questionsRepositoryProvider;
  late MockLocalQuestionsRepository mockLocalQuestionsRepository;

  setUp(() {
    mockLocalQuestionsRepository = MockLocalQuestionsRepository();
    questionsRepositoryProvider = QuestionsRepositoryProvider(localQuestionsRepository: mockLocalQuestionsRepository);
    splashViewModel = SplashViewModel(questionsRepositoryProvider: questionsRepositoryProvider);
  });



  group('get questions', () {

    final questionsFromService = [
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
    ];

    void arrangeLocalQuestionsRepositoryReturns2Questions() {
      when(() => mockLocalQuestionsRepository.fetchQuestions()).thenAnswer(
            (_) async => questionsFromService,
      );
    }

    test(
      "check if state of busy if true before get data and false after get data",
          () async {
        arrangeLocalQuestionsRepositoryReturns2Questions();
        final future = splashViewModel.getQuestions();
        expect(splashViewModel.busy, true);
        await future;
        expect(questionsRepositoryProvider.questions, questionsFromService);
        expect(splashViewModel.busy, false);
      },
    );
  });
}
