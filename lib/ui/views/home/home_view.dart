import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:personality_test_app/core/constants/routes.dart';
import 'package:personality_test_app/core/domin/questions/questions_repository_provider.dart';
import 'package:personality_test_app/core/view_models/home/home_view_model.dart';
import 'package:personality_test_app/ui/views/base/base_view.dart';
import 'package:personality_test_app/ui/views/widgets/answer_item_widget.dart';
import 'package:personality_test_app/ui/views/widgets/answers_column_widget.dart';
import 'package:personality_test_app/ui/views/widgets/custom_button_widget.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      model: HomeViewModel(
        questionsRepositoryProvider:
            Provider.of<QuestionsRepositoryProvider>(context),
      ),
      onModelReady: (HomeViewModel model) async {
        if (model.questions != null && model.questions!.isEmpty) {
          await model.refresh();
        }
        model.initialCacheAnswersList();
        model.setSelectedAnswerIndex(-1);
        model.setSelectedQuestionIndex(0);
      },
      builder: (BuildContext context, HomeViewModel model, Widget? child) =>
          Scaffold(
        appBar: AppBar(
          title: const Text("Personality Test"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
              child: model.busy
                  ? const CircularProgressIndicator()
                  : Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Text(model.questions![model.getSelectedQuestionIndex]
                              .question),
                          const SizedBox(height: 20),
                          AnswersColumnWidget(
                              selectedAnswerIndex: model.getSelectedAnswerIndex,
                              answers: model
                                  .questions![model.getSelectedQuestionIndex]
                                  .answers!,
                              onTapFirstAnswer: () {
                                model.setSelectedAnswerIndex(0);
                              },
                              onTapSecondAnswer: () {
                                model.setSelectedAnswerIndex(1);
                              },
                              onTapThirdAnswer: () {
                                model.setSelectedAnswerIndex(2);
                              },
                              onTapFourthAnswer: () {
                                model.setSelectedAnswerIndex(3);
                              }),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              model.getSelectedQuestionIndex == 0
                                  ? Container()
                                  : Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 12.0),
                                        child: CustomButtonWidget(
                                          isPreviousButton: true,
                                          onPressed: () {
                                            model.previousQuestion();
                                          },
                                        ),
                                      ),
                                    ),
                              Expanded(
                                child: CustomButtonWidget(
                                  isLastQuestion: (model.getSelectedQuestionIndex + 1) == model.questions!.length ? true : false,
                                  isNotSelectedAnswer:
                                      model.getSelectedAnswerIndex == -1
                                          ? true
                                          : false,
                                  onPressed: () {
                                    model.nextQuestion(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
        ),
      ),
    );
  }
}
