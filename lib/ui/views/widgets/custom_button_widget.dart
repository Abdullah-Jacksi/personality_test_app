import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    this.isPreviousButton = false,
    required this.onPressed,
    this.isNotSelectedAnswer = false,
    this.isLastQuestion = false,
    Key? key,
  }) : super(key: key);

  final bool isPreviousButton;
  final VoidCallback onPressed;
  final bool isNotSelectedAnswer;
  final bool isLastQuestion;

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
          child: Text(isPreviousButton ? "Previous" : isLastQuestion ? "Finish test" : "Next question",
              style: TextStyle(
                  color: isPreviousButton ? Colors.indigo : Colors.white))),
    );
  }
}
