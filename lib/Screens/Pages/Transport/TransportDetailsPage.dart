import 'package:farmart_flutter_app/Model/Trasport.dart';
import 'package:farmart_flutter_app/Model/product.dart';
import 'package:farmart_flutter_app/Model/user.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dart:io';

import 'package:farmart_flutter_app/costants.dart';

class TransportDetailView extends StatefulWidget {
  final int id;
  final String token;

  const TransportDetailView({Key key, this.id, this.token}) : super(key: key);
  @override
  _TransportDetailViewState createState() => _TransportDetailViewState();
}

class _TransportDetailViewState extends State<TransportDetailView> {
  var birthdate;
  var dateformat;
  List<Product> products;
  Product product;
  List<User> user;
  List result;
  var databyid;
  //var user;
  Future _futuretransport;
  Future<Trasport> gettrasportbyid() async {
    var token =
        "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI1IiwiaWF0IjoxNjIxMjMxNTk5LCJleHAiOjE2MzY3ODM1OTl9.hGtKW-1IRsNCttQtKHSjtAYwqd9nf05UJR0WWZAZIPOSj7U_yQncZu03oq1TEm6jqBbs8ufIHfDEmYxlsJt5qQ";
    var usertoken = widget.token;
    int pid = widget.id;
    var urlbyid = apiBase + ":9000/api/transport/80";
    var responsebyid = await http.get(
      urlbyid,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $token"
      },
    );
    var datalistbyid = jsonDecode(responsebyid.body);
    databyid = datalistbyid['data'];
    print(pid);
    if (responsebyid.statusCode == 200) {
      var test = Trasport.fromJson(datalistbyid);
      print(databyid['user']['firstName']);
      return Trasport.fromJson(jsonDecode(responsebyid.body));
      //  user = result['user'];

      // print(product.userid);
      //  birthdate = products[0].createdat;
      //  dateformat = DateFormat.yMd(product.createdat);
      //  print(birthdate);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  /*void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("can not launch");
    }
  }*/
  _launchPhoneURL(String phoneNumber) async {
    String url = 'tel:' + phoneNumber;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _futuretransport = gettrasportbyid();
    });

    // ProductService.getproducts();
  }

  @override
  Widget build(BuildContext context) {
    // DateTime createdat = product.createdat;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.favorite_rounded,
                color: Colors.grey,
              ),
              onPressed: () {})
        ],
      ),
      body: Container(
        height: 1000,
        child: FutureBuilder<Trasport>(
            future: _futuretransport,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: [
                    Image.asset("assets/tomato.jpg"),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Transporter : " + databyid['user']['firstName'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 3),
                      child: Text(
                        databyid['user']['district'],
                        //  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 0.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Maximum weight in kg " + databyid['weight'].toString(),
                        /*style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.green)*/
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 4),
                      child: Text(
                        "Charge amount : " + databyid['amount'].toString(),
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 0.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 3),
                      child: Text(
                        "Available service places",
                        //  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text("Type"),
                            SizedBox(
                              width: 150,
                            ),
                            Text(databyid['vehicleModel'])
                          ],
                        )),

                    /*   Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                              width: 160,
                              child: Text(
                                "Call to contact owner",
                                style: TextStyle(color: Colors.green),
                              )),
                        ),
                         Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              databyid['user']['contactPrimary'],
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 35.0),
                          child: IconButton(
                            onPressed: () {
                              _launchPhoneURL(databyid['user']['contactPrimary']
                                  .toString());
                            },
                            icon: Icon(
                              Icons.call,
                              color: Colors.green,
                            ),
                          ),
                        )
                      ],
                    ),*/
                    Divider(
                      color: Colors.grey,
                      thickness: 0.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: RaisedButton(
                                color: Colors.green,
                                child: Text(
                                  "Call",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  _launchPhoneURL(databyid['user']
                                          ['contactPrimary']
                                      .toString());
                                })),
                        Divider(color: Colors.white, indent: 5.0),
                        Expanded(
                            child: RaisedButton(
                                color: Colors.green,
                                child: Text(
                                  "Share",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  //_onShareData(context);
                                })),
                      ],
                    )
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
