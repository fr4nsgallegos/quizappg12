import 'package:flutter/material.dart';
import 'package:quizappg12/quiz_brain.dart';

class HomePage extends StatelessWidget {
  QuizBrain quizBrain = QuizBrain();

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();
    if (correctAnswer == userAnswer) {
      print("La respuesta es correcta");
    } else {
      print("INCORRECTOOOOO!!!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff2F3243),
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: Text("Quizz App"),
          backgroundColor: Color(0xff2F3243),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    quizBrain.getQuestionText(),
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              // ElevatedButton(onPressed: () {}, child: Text("data")),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8),

                  child: MaterialButton(
                    onPressed: () {
                      checkAnswer(true);
                    },
                    minWidth: double.infinity,
                    // minWidth: MediaQuery.of(context).size.width,
                    child: Text("Verdadero"),
                    color: Colors.greenAccent,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: MaterialButton(
                    onPressed: () {
                      checkAnswer(false);
                    },
                    minWidth: double.infinity,
                    child: Text("Falso"),
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
