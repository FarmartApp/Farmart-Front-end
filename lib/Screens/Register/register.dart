import 'dart:convert';

import 'package:farmart_flutter_app/Model/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  User user;
  Future<User> userregister() async {
    var url = "http://10.0.2.2:8087/adduser";
    var response = await http.post(url,
        headers: <String, String>{"Content-type": "application/json"},
        body: jsonEncode(<String, String>{
          "username": usernameController.text,
          "email": emailController.text,
          "phonenum": phoneController.text,
          "password": passwordController.text
        }));
    print(response);
    String responseString = response.body;
    if (response.statusCode == 200) {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext dialogcontext) {
            return MyAlertDialog(
              title: "Success",
              content: "Your account Created successfully!",
              actions: <Widget>[
                FlatButton(
                  child: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
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
              content: "Someting went wrong! ",
              actions: <Widget>[
                FlatButton(
                  child: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
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
      body: Form(
        child: ListView(children: <Widget>[
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 50.0),
              child: Text(
                "Register",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.green),
              )),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 5.0),
            child: Image.asset("assets/signup.jpg", height: size.height * 0.4),
          ),
          Container(
            child: TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Fullname is empty';
                } else {
                  return '';
                }
              },
              controller: usernameController,
              decoration: new InputDecoration(
                labelText: "Full Name",
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: new BorderSide(),
                ),
                //fillColor: Colors.green
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            child: TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Phone number is empty';
                } else {
                  return '';
                }
              },
              keyboardType: TextInputType.phone,
              controller: phoneController,
              decoration: new InputDecoration(
                labelText: "Phone Number",
                fillColor: Colors.white,
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: new BorderSide(),
                ),
                //fillColor: Colors.green
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
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
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
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
          SizedBox(
            height: 20.0,
          ),
          Container(
            child: TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Password is empty';
                } else {
                  return '';
                }
              },
              obscureText: true,
              controller: passwordController,
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
                  // print("clicked");
                  //  save();
                  //   userregister(user.username, user.email, user.phonenum,
                  //     user.passw);
                  print(phoneController.text);
                  userregister();
                },
                color: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.white),
                ),
              )),
        ]),
      ),
    );
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
