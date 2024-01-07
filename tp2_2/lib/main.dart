import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp2_2/cubits/QuestionCubit.dart';
import 'package:tp2_2/cubits/QuestionState.dart';
import 'View/QuizzPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => QuestionCubit(),
        child: BlocBuilder<QuestionCubit,QuestionState>(
          builder: (_, theme) {
            return MaterialApp(
              title: 'First Flutter App Alex',
              theme: ThemeData(),
              home: const QuizzPage(title: "Quizz"),
            );
          },
        ));
  }
}