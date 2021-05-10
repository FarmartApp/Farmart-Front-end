import 'package:farmart_flutter_app/Model/product.dart';
import 'package:farmart_flutter_app/Screens/Pages/OrderPage.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

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
    var url = "http://192.168.43.118:9000/api/productFilter?type=Fruits";
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
      backgroundColor: Colors.green,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Container(
                  width: 125,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.search, color: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      IconButton(
                          icon: Icon(Icons.add, color: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
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
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.only(left: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Fruits",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                    icon: Icon(Icons.filter_list, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
          ),
          SizedBox(
            height: 40,
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
                            padding: EdgeInsets.only(top: 45),
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              child: ListView.builder(
                                  itemCount: filteredfruitsproducts.length,
                                  itemBuilder: (context, index) {
                                    Product fruititem =
                                        filteredfruitsproducts[index];
                                    return Card(
                                        elevation: 20,
                                        color: Colors.white38,
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
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Hero(
                      tag: herotag,
                      child: Image(
                        image: AssetImage(img),
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      )),
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
