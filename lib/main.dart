import 'package:easy_quiz/quizbank.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'question.dart';

QuizBank quizbank = QuizBank();

void main() {
  runApp(Quizy());
}

class Quizy extends StatelessWidget {
  const Quizy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {


  List<Icon> ScoreKeeper = [];

  void checkAnswer(bool userSelectedAnswer){
    bool correctAnswer = quizbank.getQuestionAnswer();


    setState(() {


      if(quizbank.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished',
          desc: 'You are completed the quiz successfully',
        ).show();

        quizbank.reset();
        ScoreKeeper = [];
      }

      else{
        if(userSelectedAnswer==correctAnswer){
          ScoreKeeper.add(Icon(Icons.done, color: Colors.green,));
        }
        else{
          ScoreKeeper.add(Icon(Icons.close, color: Colors.red,));
        }

        quizbank.nextQuestion();
      }


    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                quizbank.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {

                checkAnswer(true);

              },
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                
                checkAnswer(false);

                bool correctAnswer = quizbank.getQuestionAnswer();
                if(correctAnswer==false){
                  print('You are right.');
                }
                else{
                  print('You are wrong.');
                }
                setState(() {
                  quizbank.nextQuestion();
                });
              },
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: ScoreKeeper,
        ),
      ],
    );
  }
}
