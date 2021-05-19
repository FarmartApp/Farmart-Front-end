import 'package:farmart_flutter_app/Model/product.dart';
import 'package:farmart_flutter_app/Screens/Pages/OrderPage.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../../costants.dart';

class VegetablesView extends StatefulWidget {
  final String token;

  const VegetablesView({Key key, this.token}) : super(key: key);
  @override
  _VegetablesViewState createState() => _VegetablesViewState();
}

class _VegetablesViewState extends State<VegetablesView> {
  Future _veg;
  List<Product> vegproducts = List();
  List<Product> filteredvegproducts = List();
  Future<List<Product>> getVegproducts() async {
    var usertoken = widget.token;
    var url = apiBase + ":9000/api/productFilter?type=Vegetables";
    //  var url = "http://192.168.43.118:9000/api/productFilter?type=Vegetables";
    var res = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $usertoken"
      },
    ).then((response) {
      var ddd = jsonDecode(response.body);
      var datalist = ddd["data"];
      vegproducts =
          (datalist as List).map((data) => new Product.fromJson(data)).toList();
    });
    filteredvegproducts = vegproducts;
    print(vegproducts);
    return vegproducts;
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
    super.initState();
    _veg = getVegproducts();
    // ProductService.getproducts();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("View Vegetables "),
        actions: [IconButton(icon: Icon(Icons.add), onPressed: () {})],
      ),
      // backgroundColor: Colors.green,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 20,
              child: TextFormField(
                onChanged: (text) {
                  setState(() {
                    filteredvegproducts = vegproducts
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
                  future: _veg,
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
                                  itemCount: filteredvegproducts.length,
                                  itemBuilder: (context, index) {
                                    Product vegitem =
                                        filteredvegproducts[index];
                                    return Card(
                                        elevation: 20,
                                        color: Colors.white,
                                        child: _builditem(
                                          filteredvegproducts[index].image,
                                          vegitem.name,
                                          vegitem.weight.toString(),
                                          vegitem.price.toString(),
                                          vegitem.id.toString(),
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
        onTap: () {
          /*  Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DetailsPage(img, harvestname, price, weight, herotag)));*/
        },
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
                        price.toString(),
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        weight.toString(),
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
                        "View",
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
