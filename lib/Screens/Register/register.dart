import 'dart:convert';

import 'package:farmart_flutter_app/Model/user.dart';
import 'package:farmart_flutter_app/Screens/Login/login.dart';
import 'package:farmart_flutter_app/Screens/Welcome/welcome_screen.dart';
import 'package:farmart_flutter_app/costants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int num;
  final _formkey = GlobalKey<FormState>();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController primarycontactController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<User> _user;
  Future<http.Response> userregister() async {
    var url = apiBase + ":9000/api/register";
    var response = await http.post(url,
        headers: <String, String>{"Content-type": "application/json"},
        body: jsonEncode(<String, String>{
          "firstName": firstnameController.text,
          "email": emailController.text,
          "contactPrimary": primarycontactController.text,
          "password": passwordController.text
        }));
    print(response);
    final responseString = json.decode(response.body);
    String msg = responseString["msg"];
    num = response.statusCode;
    if (response.statusCode == 200) {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext dialogcontext) {
            return MyAlertDialog(
              title: "Success",
              content: msg,
              actions: <Widget>[
                FlatButton(
                  child: Icon(Icons.close),
                  onPressed: () {
                    //  Navigator.of(context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
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
              content: msg,
              actions: <Widget>[
                FlatButton(
                  child: Icon(Icons.close),
                  onPressed: () {
                    //  Navigator.pop(context);
                    //  Navigator.push(context,
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
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
          child: (_user == null)
              ? ListView(children: <Widget>[
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
                    child: Image.asset("assets/signup.jpg",
                        height: size.height * 0.4),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                    child: Container(
                      height: 50,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Firstname is empty';
                          } else {
                            return '';
                          }
                        },
                        controller: firstnameController,
                        decoration: new InputDecoration(
                          labelText: "First Name",
                          labelStyle: TextStyle(color: Colors.black),
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                          //fillColor: Colors.green
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20,
                    ),
                    child: Container(
                      height: 50,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Primary Contact is empty';
                          } else {
                            return '';
                          }
                        },
                        keyboardType: TextInputType.phone,
                        controller: primarycontactController,
                        decoration: new InputDecoration(
                          labelText: "Primary Contact",
                          labelStyle: TextStyle(color: Colors.black),
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(55.0),
                            borderSide: new BorderSide(),
                          ),
                          //fillColor: Colors.green
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20,
                    ),
                    child: Container(
                      height: 50,
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
                          labelStyle: TextStyle(color: Colors.black),
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                          //fillColor: Colors.green
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20,
                    ),
                    child: Container(
                      height: 50,
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
                          labelStyle: TextStyle(color: Colors.black),
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(),
                          ),
                          //fillColor: Colors.green
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                          width: size.width * 0.4,
                          margin:
                              EdgeInsets.only(left: 20, top: 15.0, right: 20),
                          child: RaisedButton(
                            onPressed: () {
                              //if (_formkey.currentState.validate()) {
                              print(num);

                              userregister();

                              // }
                            },
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                            child: Text(
                              "Register",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                      Container(
                          width: size.width * 0.4,
                          margin: EdgeInsets.only(top: 15.0),
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WelcomeScreen()));
                            },
                            color: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    ],
                  ),
                ])
              : FutureBuilder<User>(
                  future: _user,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data.email);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  })),
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
