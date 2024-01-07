import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tp2_2/cubits/QuestionCubit.dart';
import 'package:tp2_2/cubits/QuestionState.dart';

class QuizzPage extends StatefulWidget
{
  const QuizzPage({Key? key, required this.title}) :super(key: key);
  final String title;

  @override
  State<QuizzPage> createState() => SomeQuizzPageState();
}
class SomeQuizzPageState extends State<QuizzPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: Center(
          child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 70,top: 6,left: 50,right: 50),
                  child: Image.asset('images/maths.jpg',width: 300, height:200 ,fit: BoxFit.cover,) ,
                ),
                Container(
                    width: 300,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Center(
                        child: BlocBuilder<QuestionCubit,QuestionState>(
                          builder:(context ,state){
                            return Text(
                              state.question.questionText,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                            );
                          },
                        ))),

                Container(
                    padding: const EdgeInsets.only(top: 80),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:<Widget>[
                          BlocBuilder<QuestionCubit,QuestionState>(
                              builder: (context, state) {
                                return Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: ButtonTheme(
                                        minWidth: 60.0,
                                        height: 35.0,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                                          ),
                                          onPressed: (){
                                            context.read<QuestionCubit>().compteur++;
                                            if(context.read<QuestionCubit>().compteur == 1){
                                              context.read<QuestionCubit>().checkAnswer(true, context);
                                            }
                                          }, child: const Text("Vrai", style: TextStyle(color: Colors.white),),
                                        )
                                    )
                                );
                              }),
                          BlocBuilder<QuestionCubit,QuestionState>(
                              builder:(context,state) {
                                return Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: ButtonTheme(
                                        minWidth: 60.0,
                                        height: 35.0,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(
                                                Colors.blue),
                                          ),
                                          onPressed: () {
                                            context.read<QuestionCubit>().compteur++;
                                            if (context.read<QuestionCubit>().compteur == 1)
                                            {
                                              context.read<QuestionCubit>().checkAnswer(true, context);
                                            }
                                          },
                                          child: const Text("Faux",
                                            style: TextStyle(color: Colors.white),),
                                        )
                                    ));
                              }),
                          BlocBuilder<QuestionCubit,QuestionState>(
                              builder: (context,state){
                                return Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: ButtonTheme(
                                        minWidth: 60.0,
                                        height: 35.0,
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                                          ),
                                          onPressed: (){
                                            context.read<QuestionCubit>().compteur++;
                                            if(context.read<QuestionCubit>().compteur > 0 && context.read<QuestionCubit>().questionNum < context.read<QuestionCubit>().questions.length)
                                            {
                                              context.read<QuestionCubit>().compteur = 0;
                                              context.read<QuestionCubit>().nextQuestion();
                                            }
                                            if(context.read<QuestionCubit>().fini == true)
                                            {
                                              Alert(
                                                  context: context,
                                                  title: "Fin du Quizz",
                                                  desc: "Score : ${context.read<QuestionCubit>().total}/${context.read<QuestionCubit>().nbQuestion} !",
                                                  buttons: [
                                                    DialogButton(
                                                      onPressed: (){
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text(
                                                        "Rejouer",
                                                        style: TextStyle(color: Colors.white),),)
                                                  ]).show();
                                              context.read<QuestionCubit>().reset();
                                            }
                                          }, child: const Icon(Icons.arrow_right),
                                        )
                                    ));
                              })
                        ]
                    )),
                BlocBuilder<QuestionCubit,QuestionState>(
                    builder: (context,state) {
                      return Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: context.read<QuestionCubit>().score,));
                    })
              ])),
    );
  }
}
/*
(countClick > 0 && _questionNumber <questions.length) {
countClick = 0;
 */

AppBar _getAppBar() {
  return AppBar(
    title: const Text('Quizz',
      style: TextStyle(color: Colors.white),),
    centerTitle: true,
    backgroundColor: Colors.blue,
  );
}