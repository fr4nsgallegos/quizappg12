import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizappg12/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
    ),
  );
}
