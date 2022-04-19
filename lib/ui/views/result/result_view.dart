import 'package:flutter/material.dart';
import 'package:personality_test_app/core/view_models/result/result_view_model.dart';
import 'package:personality_test_app/ui/utils/styles.dart';
import 'package:personality_test_app/ui/views/widgets/custom_button_widget.dart';
import 'package:provider/provider.dart';

class ResultView extends StatefulWidget {
  const ResultView({Key? key}) : super(key: key);

  @override
  _ResultViewState createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {

  @override
  Widget build(BuildContext context) {
    return Consumer<ResultViewModel>(
        builder: (BuildContext context, ResultViewModel model, Widget? child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       Text("Your Result" ,style: headline2TextStyle),
                      const SizedBox(height: 20,),
                      Flexible(child: Text(model.result, style: headline1TextStyle,textAlign: TextAlign.center,)),
                      const SizedBox(height: 50,),
                      CustomButtonWidget(
                        text: "Retake test",
                        onPressed: () {
                          model.retakeTest(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
    );
  }
}
