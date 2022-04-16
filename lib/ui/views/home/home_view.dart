import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:personality_test_app/core/domin/questions/questions_repository_provider.dart';
import 'package:personality_test_app/core/view_models/home/home_view_model.dart';
import 'package:personality_test_app/ui/views/base/base_view.dart';
import 'package:personality_test_app/ui/views/widgets/answer_item_widget.dart';
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
                          const SizedBox(
                            height: 20,
                          ),
                          AnswerItemWidget(
                            selectedAnswerIndex: model.getSelectedAnswerIndex,
                            thisItemIndex: 0,
                            letter: "A",
                            answer: model
                                .questions![model.getSelectedQuestionIndex]
                                .answers![0],
                            onTap: () {
                              model.setSelectedAnswerIndex(0);
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AnswerItemWidget(
                            selectedAnswerIndex: model.getSelectedAnswerIndex,
                            thisItemIndex: 1,
                            letter: "B",
                            answer: model
                                .questions![model.getSelectedQuestionIndex]
                                .answers![1],
                            onTap: () {
                              model.setSelectedAnswerIndex(1);
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AnswerItemWidget(
                            selectedAnswerIndex: model.getSelectedAnswerIndex,
                            thisItemIndex: 2,
                            letter: "C",
                            answer: model
                                .questions![model.getSelectedQuestionIndex]
                                .answers![2],
                            onTap: () {
                              model.setSelectedAnswerIndex(2);
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AnswerItemWidget(
                            selectedAnswerIndex: model.getSelectedAnswerIndex,
                            thisItemIndex: 3,
                            letter: "D",
                            answer: model
                                .questions![model.getSelectedQuestionIndex]
                                .answers![3],
                            onTap: () {
                              model.setSelectedAnswerIndex(3);
                            },
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              model.getSelectedQuestionIndex == 0
                                  ? Container()
                                  : Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 12.0),
                                        child: CustomButtonWidget(
                                          isPreviousButton: true,
                                          onPressed: () {
                                            log(model.getSelectedQuestionIndex
                                                .toString());
                                            if (model.getSelectedQuestionIndex >
                                                0) {
                                              model.setSelectedQuestionIndex(
                                                  model.getSelectedQuestionIndex -
                                                      1);
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                              Expanded(
                                child: CustomButtonWidget(
                                  onPressed: () {
                                    if ((model.getSelectedQuestionIndex + 1) ==
                                        model.questions!.length) {
                                      log("end of questions");
                                    } else {
                                      model.setSelectedQuestionIndex(
                                          model.getSelectedQuestionIndex + 1);
                                    }
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

