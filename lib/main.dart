import 'package:farmart_flutter_app/Screens/Welcome/welcome_screen.dart';

import 'package:farmart_flutter_app/costants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(FarmartApp());
}

class FarmartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
      debugShowCheckedModeBanner: false,
      title: 'Authentication',
      theme: ThemeData(
          //to use default text as poppins
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white),
    );
  }
}
