import 'package:flutter/material.dart';

class AnswerItemWidget extends StatelessWidget {
  AnswerItemWidget({
    required this.onTap,
    required this.selectedAnswerIndex,
    required this.thisItemIndex,
    required this.letter,
    required this.answer,
    Key? key,
  }) : super(key: key);

  final GestureTapCallback onTap;
  final int selectedAnswerIndex;
  final int thisItemIndex;
  final String letter;
  final String answer;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                width: 1,
                color: selectedAnswerIndex == thisItemIndex
                    ? Colors.red
                    : Colors.grey)),
        child: Row(
          children: [
            Container(
              height: 35,
              width: 35,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: selectedAnswerIndex == thisItemIndex
                    ? Colors.red : Colors.grey[200],
                borderRadius: BorderRadius.circular(5),),
              child:  Center(child: Text(letter , style: TextStyle(color: selectedAnswerIndex == thisItemIndex
                  ? Colors.white : Colors.black),)),
            ),
            const SizedBox(width: 10,),
            Flexible(
              child: Text(
                answer,
                style: selectedAnswerIndex == thisItemIndex
                    ? const TextStyle(fontWeight: FontWeight.w800)
                    : const TextStyle(
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
