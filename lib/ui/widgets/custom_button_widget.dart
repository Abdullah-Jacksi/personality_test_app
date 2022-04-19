import 'package:flutter/material.dart';
import 'package:personality_test_app/ui/utils/styles.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    this.isPreviousButton = false,
    required this.onPressed,
    this.isNotSelectedAnswer = false,
    this.isLastQuestion = false,
    required this.text,
    Key? key,
  }) : super(key: key);

  final bool isPreviousButton;
  final VoidCallback onPressed;
  final bool isNotSelectedAnswer;
  final bool isLastQuestion;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ElevatedButton(
          style: isPreviousButton
              ? ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side: const BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                )
              : ButtonStyle(
                  backgroundColor: isNotSelectedAnswer
                      ? MaterialStateProperty.all<Color>(Colors.grey)
                      : isLastQuestion
                          ? MaterialStateProperty.all<Color>(Colors.red)
                          : MaterialStateProperty.all<Color>(Colors.indigo),
                ),
          onPressed: isNotSelectedAnswer ? null : onPressed,
          child: Text(
            text,
            style: isPreviousButton
                ? previousQuestionButtonTextStyle
                : nextQuestionButtonTextStyle,
            // TextStyle(
            //     color: isPreviousButton ? Colors.indigo : Colors.white)
          )),
    );
  }
}
