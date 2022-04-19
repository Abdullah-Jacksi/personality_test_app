import 'package:flutter/material.dart';
import 'package:personality_test_app/core/constants/routes.dart';
import 'package:personality_test_app/core/view_models/base/base_view_models.dart';
import 'package:personality_test_app/core/view_models/home/home_view_model.dart';

class ResultViewModel extends BaseViewModel {
  ResultViewModel({
    required HomeViewModel homeViewModel,
  }) : _homeViewModel = homeViewModel;

  final HomeViewModel _homeViewModel;

  String get result {
    if (_homeViewModel.getResultScore() >= 7) {
      return "You are more of a public extrovert and private introvert";
    }
    return "You are more of an introvert";
  }

  void retakeTest(BuildContext context) {
    goTo(context, path: RoutePaths.home, pushAndReplace: true);
  }
}
