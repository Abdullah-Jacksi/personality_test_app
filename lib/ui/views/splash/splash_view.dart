import 'package:flutter/material.dart';
import 'package:personality_test_app/core/domin/questions/questions_repository_provider.dart';
import 'package:personality_test_app/core/view_models/splash_view_model/splash_view_model.dart';
import 'package:personality_test_app/ui/views/base/base_view.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    controller?.repeat(reverse: true);
    controller?.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
        model: SplashViewModel(
          questionsRepositoryProvider: Provider.of<QuestionsRepositoryProvider>(context),
        ),
        onModelReady: (SplashViewModel model) async {
          await model.onReady(context);
        },
        builder: (BuildContext context, SplashViewModel model, Widget? child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Center(
                child: Opacity(
                  opacity: controller?.value as double,
                  child: Image.asset(
                    "assets/logo.png",
                    width: MediaQuery.of(context).size.width * 0.6,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          );
        }
        );
  }

}
