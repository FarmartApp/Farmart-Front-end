import 'package:farmart_flutter_app/Model/product.dart';
import 'package:farmart_flutter_app/Screens/Pages/OrderPage.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../../costants.dart';

class FruitsView extends StatefulWidget {
  final String token;

  const FruitsView({Key key, this.token}) : super(key: key);
  @override
  _FruitsViewState createState() => _FruitsViewState();
}

class _FruitsViewState extends State<FruitsView> {
  Future _fruits;
  List<Product> fruitsproducts = List();
  List<Product> filteredfruitsproducts = List();
  Future<List<Product>> getFruitproducts() async {
    var usertoken = widget.token;
    var url = apiBase + ":9000/api/productFilter?type=Fruits";
    // var url = "http://192.168.43.118:9000/api/productFilter?type=Fruits";
    var res = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $usertoken"
      },
    ).then((response) {
      var ddd = jsonDecode(response.body);
      var datalist = ddd["data"];
      fruitsproducts =
          (datalist as List).map((data) => new Product.fromJson(data)).toList();
    });
    filteredfruitsproducts = fruitsproducts;
    print(fruitsproducts);
    return fruitsproducts;
  }

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
    // getFruitproducts();
    super.initState();
    setState(() {
      _fruits = getFruitproducts();
    });

    // ProductService.getproducts();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("View Fruits "),
        actions: [IconButton(icon: Icon(Icons.add), onPressed: () {})],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 20,
              child: TextFormField(
                onChanged: (text) {
                  setState(() {
                    filteredfruitsproducts = fruitsproducts
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
          Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(40))),
              child: FutureBuilder<List<Product>>(
                  future: _fruits,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView(
                        scrollDirection: Axis.vertical,

                        //  primary: false,
                        padding: EdgeInsets.only(left: 25, right: 20),
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              child: ListView.builder(
                                  itemCount: filteredfruitsproducts.length,
                                  itemBuilder: (context, index) {
                                    Product fruititem =
                                        filteredfruitsproducts[index];
                                    return Card(
                                        elevation: 20,
                                        color: Colors.white,
                                        child: _builditem(
                                          "assets/tomato.jpg",
                                          fruititem.name,
                                          fruititem.weight.toString(),
                                          fruititem.price.toString(),
                                          fruititem.id.toString(),
                                        ));
                                  }),
                            ),
                          )
                        ],
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }))
        ],
      ),
    );
  }

  Widget _builditem(String img, String harvestname, String price, String weight,
      String herotag) {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 150,
                    child: showImage(img),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        harvestname,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        price,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        weight,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  height: 30,
                  width: 80,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Order",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.green,
                      onPressed: () {}),
                ),
                IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.white54,
                    ),
                    onPressed: () {
                      print(MediaQuery.of(context).size);
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
