import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:typed_data';

import 'package:farmart_flutter_app/Model/product.dart';
import 'package:farmart_flutter_app/Model/user.dart';
import 'package:farmart_flutter_app/Screens/Home/Fruits.dart';
import 'package:farmart_flutter_app/Screens/Pages/DEtailViewPage.dart';
import 'package:farmart_flutter_app/Screens/Pages/Editprofilepage.dart';
import 'package:farmart_flutter_app/Screens/Pages/OrderPage.dart';
import 'package:farmart_flutter_app/Screens/Product/Addharvest.dart';
import 'package:farmart_flutter_app/Service/getallitems.dart';
import 'package:flutter/material.dart';

import 'DetailsPage.dart';
import 'Vegetales.dart';

class HomePageBody extends StatefulWidget {
  final String token;
  final User user;

  const HomePageBody({Key key, this.token, this.user}) : super(key: key);

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  DateTime currentdate = DateTime.now();
  var resbody;
  List<Product> filteredproductlist = List();
  Product product;
  //User user;
  ProductService service;
  List<Product> products = List();
  Future _future;
  Future<List<Product>> fprod;
  Future<List<Product>> getproducts() async {
    var usertoken = widget.token;
    var url = "http://192.168.43.118:9000/api/product";
    var res = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $usertoken"
      },
    ).then((response) {
      var ddd = jsonDecode(response.body);
      var datalist = ddd["data"];
      products =
          (datalist as List).map((data) => new Product.fromJson(data)).toList();
      filteredproductlist = products;
    });

    print(products.length);
    return products;
  }

  Future<List<Product>> searchproduct() async {
    filteredproductlist = products;
    return filteredproductlist;
  }

  Image img;
  showImage(String imagedata) {
    if (imagedata.length % 4 > 0) {
      // imagedata += '=====' * (4 - imagedata.length % 4);
      print(imagedata.length);
    }

    final _byteImage = Base64Decoder().convert(imagedata);
    Widget image = Image.memory(_byteImage);
    return image;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      getproducts();
      _future = getproducts();
    });

    // ProductService.getproducts();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 20,
                child: TextFormField(
                  onChanged: (text) {
                    setState(() {
                      filteredproductlist = products
                          .where((element) => (element.name
                              .toLowerCase()
                              .contains(text.toLowerCase())))
                          .toList();
                    });
                  },
                  decoration: InputDecoration(
                      hintText: "Search here",
                      contentPadding: EdgeInsets.only(left: 18),
                      //  fillColor: Colors.white,
                      labelStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide())),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Categories",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 150,
                ),
                Expanded(
                  child: RaisedButton(
                    color: Colors.green,
                    onPressed: () {
                      print(products.length);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (contex) => AddHarvestPage(
                                    token: widget.token,
                                  )));
                    },
                    shape: StadiumBorder(),
                    child: Text(
                      "+ Add",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => VegetablesView(
                                  token: widget.token,
                                )));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 220.0,
                    height: MediaQuery.of(context).size.width - 210.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.withOpacity(0.2))
                        ]),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              "assets/veg.jpeg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Vegetables",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => FruitsView(
                                  token: widget.token,
                                )));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 220.0,
                    height: MediaQuery.of(context).size.width - 210.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.withOpacity(0.2))
                        ]),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              "assets/fruits2.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Fruits",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text("Recents",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  width: 220,
                ),
                Text("Filter by", style: TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
            Expanded(
                child: FutureBuilder<List<Product>>(
                    future: _future,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                            child: GridView.builder(
                                itemCount: filteredproductlist.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  Product productobj =
                                      filteredproductlist[index];
                                  return Container(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailView(
                                                      id: productobj.id,
                                                      token: widget.token,
                                                    )));

                                        /*  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsPage(
                                          "assets/fruits2.jpg",
                                          productobj.name,
                                          productobj.price.toString(),
                                          productobj.weight.toString(),
                                          productobj.id.toString())));*/
                                      },
                                      child: Card(
                                        child: Stack(
                                          children: [
                                            /* Hero(
                                      tag: productobj.id,
                                      child: Image(
                                          image: showImage(productobj.image))),*/
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: 5, top: 0),
                                              child: IconButton(
                                                color: Colors.grey[100],
                                                icon: Icon(Icons.favorite),
                                                onPressed: () {},
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 100),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                      child: Text(
                                                    productobj.name,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Expanded(
                                                      child: Text(
                                                    productobj.weight
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ))
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 120),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                      child: Text(
                                                    productobj.price.toString(),
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ))
                                                ],
                                              ),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    top: 140, left: 30),
                                                child: InkWell(
                                                  onTap: () {},
                                                  child: Text(
                                                    "Click to order",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ))
                                          ],
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            side: BorderSide(
                                                color: Colors.grey
                                                    .withOpacity(0.1))),
                                        color: Colors.grey.withOpacity(0.2),
                                      ),
                                    ),
                                  );
                                }));
                      } else if (snapshot.hasError) {
                        return Center(
                            child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.amber),
                        ));
                      }
                      return CircularProgressIndicator();
                    }))
          ],
        ),
      ),
    );
  }
}
