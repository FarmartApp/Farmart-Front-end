import 'dart:convert';

import 'package:farmart_flutter_app/Model/user.dart';
import 'package:farmart_flutter_app/Screens/Home/homePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Transport/Transport.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int id;
  var response;
  //Future<User> _user;

  var url = "http://192.168.43.118:9000/api/login";
  Future<http.Response> getUser() async {
    response = await http.post(url,
        headers: <String, String>{"Content-type": "application/json"},
        body: jsonEncode(<String, String>{}));
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
              content:
                  "Order request sent successfully. Do you want transport service? ",
              actions: <Widget>[
                FlatButton(
                  child: Text("Yes"),
                  onPressed: () {
                    //  getuserdata();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                TransportPage()));
                  },
                ),
                FlatButton(
                  child: Text("No"),
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
    var orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.portrait) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Order"),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: ListView(
          children: [
            Container(
              height: 150,
              child: Card(
                  elevation: 10,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Image.asset(
                          "assets/tomato.jpg",
                          height: 200,
                          width: 200,
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Column(
                          children: [
                            Text("Name"),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Price"),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: TextFormField(
                    decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your current location',
                ))),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: TextFormField(
                    decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Phone number',
                ))),
            ListTile(
              title: Text("Owner contact"),
              trailing: IconButton(
                  icon: Icon(
                    Icons.call,
                    color: Colors.green,
                  ),
                  onPressed: () {}),
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                      width: 160,
                      child: RaisedButton(
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text("Place Order",
                              style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TransportPage()));
                          })),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                      width: 160,
                      child: RaisedButton(
                          color: Colors.grey[600],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text("Cancel",
                              style: TextStyle(color: Colors.white)),
                          onPressed: () {})),
                ),
              ],
            )
          ],
        ),
      );
    }
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
