import 'package:flutter/material.dart';
import 'package:personality_test_app/ui/views/widgets/answer_item_widget.dart';

class AnswersColumnWidget extends StatelessWidget {
  const AnswersColumnWidget({
    Key? key,
    required this.selectedAnswerIndex,
    required this.answers,
    required this.onTapFirstAnswer,
    required this.onTapSecondAnswer,
    required this.onTapThirdAnswer,
    required this.onTapFourthAnswer,
  }) : super(key: key);

  final int selectedAnswerIndex;
  final List<String> answers;
  final GestureTapCallback onTapFirstAnswer;
  final GestureTapCallback onTapSecondAnswer;
  final GestureTapCallback onTapThirdAnswer;
  final GestureTapCallback onTapFourthAnswer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnswerItemWidget(
          selectedAnswerIndex: selectedAnswerIndex,
          thisItemIndex: 0,
          letter: "A",
          answer: answers[0],
          onTap: onTapFirstAnswer,
        ),
        const SizedBox(height: 10),
        AnswerItemWidget(
          selectedAnswerIndex: selectedAnswerIndex,
          thisItemIndex: 1,
          letter: "B",
          answer: answers[1],
          onTap: onTapSecondAnswer,
        ),
        const SizedBox(height: 10),
        AnswerItemWidget(
          selectedAnswerIndex: selectedAnswerIndex,
          thisItemIndex: 2,
          letter: "C",
          answer: answers[2],
          onTap: onTapThirdAnswer,
        ),
        const SizedBox(height: 10),
        AnswerItemWidget(
          selectedAnswerIndex: selectedAnswerIndex,
          thisItemIndex: 3,
          letter: "D",
          answer: answers[3],
          onTap: onTapFourthAnswer,
        ),
      ],
    );
  }
}
