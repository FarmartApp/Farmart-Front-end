import 'package:farmart_flutter_app/Model/product.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:io';
import 'OrderPage.dart';

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
      // print(product);
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
                                width: 250,
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
                                width: 150,
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
                                width: 220,
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
                        height: 30,
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
                                    child: Text("Order",
                                        style: TextStyle(color: Colors.white)),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  OrderPage()));
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
                                        style: TextStyle(color: Colors.white)),
                                    onPressed: () {})),
                          ),
                        ],
                      )
                    ],
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              })),
    );
  }
}
