import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizappg12/quiz_brain.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  QuizBrain quizBrain = QuizBrain();
  List<Widget> score = [];
  void checkAnswer(bool userAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();
    //CUANDO LA RESPUESTA ES CORRECTA
    if (correctAnswer == userAnswer) {
      score.add(itemScore((quizBrain.questionIndex + 1).toString(), true));
      print("La respuesta es correcta");
    }
    // CUANDO LA RESPUESTA ES INCORRECTA
    else {
      score.add(itemScore((quizBrain.questionIndex + 1).toString(), false));
      print("INCORRECTOOOOO!!!");
    }

    if (quizBrain.isFinishedFunc()) {
      print("El cuestionario ha terminado");
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.warning, color: Colors.orange),
                Text("Alerta"),
              ],
            ),
            content: Text("Has llegado al final del formulario"),
            // alignment: Alignment.center,
            // titlePadding: EdgeInsets.all(8),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  quizBrain.restartQuizz();
                  Navigator.pop(context);
                  score.clear();
                  setState(() {});
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
      return;
    }

    // print("--------------------");
    // print(quizBrain.questionIndex);
    // print(quizBrain.questionList.length - 1);
    // print("--------------------");

    // if (quizBrain.questionIndex < quizBrain.questionList.length - 1) {
    //   quizBrain.nextQuestion();
    // } else {
    //   print("El formulario ha terminado");
    //   return;
    // }
    quizBrain.nextQuestion();

    // if (quizBrain.isFinished() == true) {
    //   print("El cuestionario ha terminado");
    // } else {
    //   quizBrain.nextQuestion();
    // }

    setState(() {});
  }

  Widget itemScore(String numberQuestion, bool isCorrect) {
    return Row(
      children: [
        Text(
          numberQuestion,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        Icon(
          isCorrect ? Icons.check : Icons.close,
          color: isCorrect ? Colors.greenAccent : Colors.redAccent,
        ),
      ],
    );
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
                    "${quizBrain.questionIndex + 1}. ${quizBrain.getQuestionText()}",
                    style: GoogleFonts.dancingScript(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                    //  TextStyle(color: Colors.white, fontSize: 25),
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
              Row(mainAxisAlignment: MainAxisAlignment.center, children: score),
            ],
          ),
        ),
      ),
    );
  }
}
