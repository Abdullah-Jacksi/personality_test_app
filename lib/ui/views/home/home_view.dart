import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:personality_test_app/core/view_models/home/home_view_model.dart';
import 'package:personality_test_app/ui/utils/styles.dart';
import 'package:personality_test_app/ui/views/widgets/answers_column_widget.dart';
import 'package:personality_test_app/ui/views/widgets/custom_button_widget.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    Future.microtask(() async {
      final model = context.read<HomeViewModel>();
      if (model.questions != null && model.questions!.isEmpty) {
        await model.refresh();
      }
      model.initialCacheAnswersList();
      model.setSelectedAnswerIndex(-1);
      model.setSelectedQuestionIndex(0);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (BuildContext context, HomeViewModel model, Widget? child) =>
          Scaffold(
        appBar: AppBar(
          title: const Text("Personality Test"),
          centerTitle: true,
          leading: Container(),
        ),
        body: SafeArea(
          child: Center(
              child: (model.busy || model.questions == null)
                  ? const CircularProgressIndicator()
                  : Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Text(
                            model.questions?[model.getSelectedQuestionIndex]
                                    .question ??
                                "question",
                            style: headline2TextStyle,
                          ),
                          const SizedBox(height: 20),
                          AnswersColumnWidget(
                              selectedAnswerIndex: model.getSelectedAnswerIndex,
                              answers: model
                                      .questions?[
                                          model.getSelectedQuestionIndex]
                                      .answers ??
                                  ['', '', '', ''],
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
                                          text: "Previous",
                                          isPreviousButton: true,
                                          onPressed: () {
                                            model.goToPreviousQuestion();
                                          },
                                        ),
                                      ),
                                    ),
                              Expanded(
                                child: CustomButtonWidget(
                                  text: model.checkIfLastQuestion()
                                      ? "Finish test"
                                      : "Next question",
                                  isLastQuestion: model.checkIfLastQuestion(),
                                  isNotSelectedAnswer:
                                      model.checkIfNotSelectedAnswer(),
                                  onPressed: () {
                                    model.goToNextQuestion(context);
                                    log("update + " +
                                        model.getSelectedQuestionIndex
                                            .toString());
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
