import 'dart:convert';
import 'dart:io';

import 'package:farmart_flutter_app/Model/product.dart';
import 'package:farmart_flutter_app/Model/user.dart';
import 'package:farmart_flutter_app/Screens/Home/homePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Transport/Transport.dart';

class OrderPage extends StatefulWidget {
  final int id;
  final String token;

  const OrderPage({Key key, this.id, this.token}) : super(key: key);
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  var response;
  //Future<User> _user;
  List<Product> products;
  Product product;
  List result;
  Future _futureproduct;
  Future<Product> getproductbyid() async {
    var usertoken = widget.token;
    int pid = widget.id;
    var url = "http://192.168.43.118:9000/api/product?id=$pid";
    var res = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $usertoken"
      },
    );

    var datalist = json.decode(res.body);
    var result = datalist["data"];
    products =
        (result as List).map((data) => new Product.fromJson(data)).toList();
    if (res.statusCode == 200) {
      product = products[0];
     // User userd = product.user;
     // print(userd);
      //  birthdate = products[0].createdat;
      //  dateformat = DateFormat.yMd(product.createdat);
      //  print(birthdate);
    }
    return product;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _futureproduct = getproductbyid();
    });

    // ProductService.getproducts();
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
          body: Container(
            child: FutureBuilder(
                future: _futureproduct,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
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
                                        Text(
                                          product.name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text("Rs" + product.price.toString()),
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 10),
                            child: TextFormField(
                                decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Enter your current location',
                            ))),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 10),
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
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text("Place Order",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TransportPage()));
                                      })),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                  width: 160,
                                  child: RaisedButton(
                                      color: Colors.grey[600],
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text("Cancel",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      onPressed: () {})),
                            ),
                          ],
                        )
                      ],
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ));
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
