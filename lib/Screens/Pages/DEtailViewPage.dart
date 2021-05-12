import 'package:farmart_flutter_app/Model/product.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'OrderPage.dart';
import 'package:farmart_flutter_app/costants.dart';

class DetailView extends StatefulWidget {
  final int id;
  final String token;

  const DetailView({Key key, this.id, this.token}) : super(key: key);
  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  var birthdate;
  var dateformat;
  List<Product> products;
  Product product;
  List result;
  //var user;
  Future _futureproduct;
  Future<Product> getproductbyid() async {
    var usertoken = widget.token;
    int pid = widget.id;
    var url = apiBase + ":9000/api/product?id=$pid";
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
      //  user = result['user'];
      //print(user);
      // print(product.userid);
      //  birthdate = products[0].createdat;
      //  dateformat = DateFormat.yMd(product.createdat);
      //  print(birthdate);
    }
    return product;
  }

  int phone = 0764236982;

  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print("can not launch");
    }
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
          child: FutureBuilder<Product>(
              future: _futureproduct,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    children: [
                      Image.asset("assets/tomato.jpg"),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          product.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 3),
                        child: Text(
                          product.location,
                          //  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 3),
                        child: Text(
                          product.weight.toString() + " Kg",
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
                          "Rs " + product.price.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.green),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 4),
                        child: Text(
                          "For sale by",
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 0.0,
                      ),
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Text("Type"),
                              SizedBox(
                                width: 150,
                              ),
                              Text(product.productType)
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Text("Is Delivery Available"),
                              SizedBox(
                                width: 60,
                              ),
                              Text(product.deliveryAvailable.toString())
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Text("For sale by"),
                              SizedBox(
                                width: 120,
                              ),
                              Text("Yes")
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 14),
                          child: Text(
                            "Description",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 0.0,
                      ),
                      Row(
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
                            padding: const EdgeInsets.only(left: 35.0),
                            child: IconButton(
                              onPressed: () {
                                customLaunch('https://flutter.dev');
                              },
                              icon: Icon(
                                Icons.call,
                                color: Colors.green,
                              ),
                            ),
                          )
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 0.0,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 14),
                          child: Text(
                            "Suggest transport",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          )),
                    ],
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              })),
    );
  }
}
