import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/Question.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'QuestionState.dart';

class QuestionCubit extends Cubit<QuestionState> {

  final List<Widget> score = [];
  int compteur = 0;
  int nbQuestion = 5;
  int questionNum = 0;
  bool fini = false;
  int total = 0;
  late Question question = Question(questionText: "1+1 = 2", isCorrect: true);

  final List<Question> questions = [
    Question(questionText: "1+1 = 2", isCorrect: true),// 1
    Question(questionText: "1+2 = 2", isCorrect: false),// 2
    Question(questionText: "1+3 = 4", isCorrect: true),// 3
    Question(questionText: "1+2 = 3", isCorrect: true),// 4
    Question(questionText: "1+6 = 2", isCorrect: false),// 5
  ];

  QuestionCubit()
      : super(QuestionState(0,Question(questionText: "1+1 = 2", isCorrect: true)));

  List<Question> get getquestions => questions;
  bool get getfini => fini;
  int get getquestionNum => questionNum;
  int get gettotal => total;
  int get getnbQuestion => nbQuestion;
  Question get getquestion => question;

  set setFini(bool number)
  {
    fini = number;
    emit(QuestionState(questionNum,question));
  }

  checkAnswer(bool userChoice, BuildContext context)
  {
    if (questions[questionNum].isCorrect == userChoice)
    {
      total = total + 1;
      score.add(const Icon(Icons.check, color: Colors.green));
      emit(QuestionState(questionNum, question));

    }
    else
    {
      score.add(const Icon(Icons.close, color: Colors.red));
      emit(QuestionState(questionNum, question));
    }
  }

  nextQuestion() {
    if (questionNum < questions.length - 1)
    {
      questionNum++;
      question = questions[questionNum];
      emit(QuestionState(questionNum, question));

    }
    else
    {
      fini = true;
      emit(QuestionState(questionNum, question));
    }
  }

  reset()
  {
    questionNum = 0;
    question = questions[questionNum];
    emit(QuestionState(questionNum, question));
    total = 0;
    compteur = 0;
    fini = false;
    score.clear();
  }
}