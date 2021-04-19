import 'dart:convert';

import 'package:farmart_flutter_app/Model/user.dart';
import 'package:farmart_flutter_app/Screens/Home/homePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Components/loginbody.dart';
import 'otp_ui.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String email;
  String password;
  var response;
  String url = "http://10.0.2.2:8087/user/login";
  Future<User> getUser() async {
    response = await http.post(url,
        headers: <String, String>{"Content-type": "application/json"},
        body: jsonEncode(<String, String>{
          "email": emailController.text,
          "password": passwordController.text
        }));
    if (response.statusCode == 200) {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext dialogcontext) {
            return MyAlertDialog(
              title: "Success",
              content: "Authentication success!",
              actions: <Widget>[
                FlatButton(
                  child: Icon(Icons.close),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => HomePage()));
                  },
                )
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext dialogcontext) {
            return MyAlertDialog(
              title: "Error",
              content: "Account Not Found",
              actions: <Widget>[
                FlatButton(
                  child: Icon(Icons.close),
                  onPressed: () {
                    // Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => HomePage()));
                  },
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Column(children: <Widget>[
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 50.0),
              child: Text(
                "LOGIN",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.green),
              )),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 5.0),
            child: Image.asset("assets/login1.png",
                width: size.width * 0.8, height: size.height * 0.6),
          ),
          Container(
            child: TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Email is empty';
                } else {
                  return '';
                }
              },
              onChanged: (value) {
                email = emailController.text;
              },
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: new InputDecoration(
                labelText: "Email Address",
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: new BorderSide(),
                ),
                //fillColor: Colors.green
              ),
            ),
          ),
          Container(
            child: TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Email is empty';
                } else {
                  return '';
                }
              },
              onChanged: (value) {
                password = passwordController.text;
              },
              controller: passwordController,
              obscureText: true,
              decoration: new InputDecoration(
                labelText: "Password",
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: new BorderSide(),
                ),
                //fillColor: Colors.green
              ),
            ),
          ),
          Container(
              width: size.width * 0.4,
              margin: EdgeInsets.only(top: 30.0),
              child: RaisedButton(
                onPressed: () {
                  //if (_formkey.currentState.validate()) {
                  getUser();

                  // }
                },
                color: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              )),
        ]),
      ),
    ));
  }
}

class MyAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;
  const MyAlertDialog({Key key, this.title, this.content, this.actions})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(this.title),
      content: Text(this.content),
      actions: this.actions,
    );
  }
}
