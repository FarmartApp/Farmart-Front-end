import 'package:farmart_flutter_app/Screens/Welcome/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/Home/home.dart';
import 'Screens/Home/homePage.dart';
import 'Screens/Login/login.dart';
import 'Screens/Register/register.dart';
import 'package:farmart_flutter_app/costants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
//  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  // var email = sharedPreferences.getString('email');
  runApp(FarmartApp());
}

class FarmartApp extends StatelessWidget {
  // final email;

  //const FarmartApp({Key key, this.email}) : super(key: key);
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
