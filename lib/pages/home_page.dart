import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                    "¿El hombre llego a la luna?",
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
                    onPressed: () {},
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
                    onPressed: () {},
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
