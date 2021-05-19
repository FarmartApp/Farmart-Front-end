import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:farmart_flutter_app/Model/product.dart';
import 'package:farmart_flutter_app/Model/user.dart';
import 'package:flutter/material.dart';

import '../../costants.dart';

class Homeimage extends StatefulWidget {
  final ImageData;
  final token;

  const Homeimage({Key key, this.ImageData, this.token}) : super(key: key);
  @override
  _HomeimageState createState() => _HomeimageState();
}

class _HomeimageState extends State<Homeimage> {
  List<Product> products;
  Product product;
  List<User> user;
  List result;
  String ImageDataform;
  var databyid;
  //var user;
  Future _futureproduct;
  Future<Product> getproductbyid() async {
    var usertoken = widget.token;
    //  int pid = widget.id;
    var urlbyid = apiBase + ":9000/api/product/125";
    var responsebyid = await http.get(
      urlbyid,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $usertoken"
      },
    );
    var datalistbyid = jsonDecode(responsebyid.body);
    databyid = datalistbyid['data'];
    print(pid);
    if (responsebyid.statusCode == 200) {
      var test = Product.fromJson(datalistbyid);

      ImageDataform = databyid['image'];
      print(ImageDataform);
      return Product.fromJson(jsonDecode(responsebyid.body));

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

  @override
  void initState() {
    super.initState();

    setState(() {
      _futureproduct = getproductbyid();
      print(ImageDataform);
    });

    // ProductService.getproducts();
  }

  showImage(String image) {
    return Image.memory(base64Decode(image));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          RaisedButton(onPressed: () {
            print(ImageDataform);
          })
          /*ImageDataform != null
              ? Container(
                  height: 50, width: 50, child: showImage(ImageDataform))
              : Center(child: Text("nooo"))*/
        ],
      ),
    );
  }
}
