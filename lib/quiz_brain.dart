import 'package:quizappg12/models/question_model.dart';

class QuizBrain {
  List<QuestionModel> questionList = [
    QuestionModel(question: "¿El hombre llego a la luna?", answer: true),
    QuestionModel(question: "¿Has almorzado hoy?", answer: false),
    QuestionModel(question: "¿Saliste ayer?", answer: false),
    QuestionModel(question: "¿Has desayunado?", answer: true),
    QuestionModel(question: "¿Sientes frio?", answer: false),
  ];

  int questionIndex = 0;
  String getQuestionText() {
    return questionList[questionIndex].question;
  }

  bool getQuestionAnswer() {
    return questionList[questionIndex].answer;
  }

  void nextQuestion() {
    // questionIndex++; //questionIndex = questionIndex + 1 ;
    if (questionIndex < questionList.length - 1) {
      questionIndex++;
    }
  }

  void isFinished() {
    if (questionIndex > questionList.length - 1) {
      nextQuestion();
    } else {
      print("El formulario ha terminado");
    }
  }
}
