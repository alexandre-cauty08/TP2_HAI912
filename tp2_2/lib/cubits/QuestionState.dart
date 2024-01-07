import '../../models/Question.dart';

class QuestionState{

  final int index;
  final Question question;

  QuestionState(this.index,this.question);

  Question get getquestion => question;
  int get getindex => index;


}