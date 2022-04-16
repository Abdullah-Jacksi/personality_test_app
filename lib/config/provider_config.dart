import 'package:flutter/material.dart';
import 'package:personality_test_app/core/domin/questions/questions_repository_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
      create: (BuildContext context) => QuestionsRepositoryProvider()),
];
