import 'dart:convert';
import 'package:farmart_flutter_app/Model/user.dart';
import 'package:farmart_flutter_app/Screens/Home/homePage.dart';
import 'package:farmart_flutter_app/Screens/Welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:farmart_flutter_app/costants.dart';

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

  int id;
  var response;
  //Future<User> _user;

  var url = apiBase + ":9000/api/login";
  Future<http.Response> getUser() async {
    response = await http.post(url,
        headers: <String, String>{"Content-type": "application/json"},
        body: jsonEncode(<String, String>{
          "email": emailController.text,
          "password": passwordController.text
        }));
    final responseJson = json.decode(response.body);
    String message = responseJson["msg"];
    final datajson = responseJson["data"];
    String token = datajson["token"];
    final userjsondata = datajson["user"];
    User user = User.fromJson(userjsondata);
    //Data data = Data.fromJson(datajson);
    /*String objText = '{"firstName": "bezkoder", "email": "example@gmail.com"}';
    User user = User.fromJson(jsonDecode(objText));*/
    id = user.id;
    if (response.statusCode == 200) {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext dialogcontext) {
            return MyAlertDialog(
              title: "Success",
              content: message,
              actions: <Widget>[
                FlatButton(
                  child: Icon(Icons.close),
                  onPressed: () {
                    //  getuserdata();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => HomePage(
                                  token: token,
                                  user: user,
                                )));
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
              content: message,
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

    return response;
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
                width: size.width * 0.8, height: size.height * 0.54),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12),
            child: Container(
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
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12, top: 10),
            child: Container(
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Password is empty';
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
          ),
          Row(
            children: [
              Container(
                  width: size.width * 0.4,
                  margin: EdgeInsets.only(left: 20, top: 30.0, right: 20),
                  child: RaisedButton(
                    onPressed: () {
                      //if (_formkey.currentState.validate()) {
                      //
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
              Container(
                  width: size.width * 0.4,
                  margin: EdgeInsets.only(top: 30.0),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomeScreen()));
                    },
                    color: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: InkWell(
              onTap: () {},
              child: Text(
                "Forgot Password?",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          )
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
