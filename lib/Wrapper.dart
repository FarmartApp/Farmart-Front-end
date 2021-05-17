import 'dart:convert';

import 'package:farmart_flutter_app/Model/user.dart';
import 'package:farmart_flutter_app/Screens/Home/homePage.dart';
import 'package:farmart_flutter_app/Screens/Login/login.dart';
import 'package:farmart_flutter_app/Screens/Welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String _email = '';
// ignore: unused_element
String _token = '';
User _user;

class Wrapper extends StatefulWidget {
  @override
  _NextState createState() => _NextState();
}

class _NextState extends State<Wrapper> {
  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _email = (prefs.getString('email') ?? '');
      _token = (prefs.getString('token') ?? '');
      _user = json.decode(prefs.getString('user') ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_email.length < 0) {
      print(_user);
      return HomePage(
        token: _token,
        user: _user,
      );
    } else {
      print(_user);
      return LoginScreen();
    }
  }
}
