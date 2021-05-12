import 'dart:convert';
import 'dart:io';
import 'package:farmart_flutter_app/costants.dart';
import 'package:http/http.dart';
import 'package:farmart_flutter_app/Model/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductService {
  final int id;
  final String token;
  ProductService(this.id, this.token);
  String url = apiBase + ":9000/api/productFilter?date=true";
  List<Product> products = List();

  Future<List<Product>> getproducts() async {
    try {
      var res = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: "Bearer $token"
        },
      );
      if (res.statusCode == 200) {
        var ddd = jsonDecode(res.body);
        var datalist = ddd["data"];
        products = parsePostsForHome(datalist);
        return products;
      } else {
        throw Exception(MESSAGES.INTERNET_ERROR);
      }
    } catch (e) {
      throw Exception(MESSAGES.INTERNET_ERROR);
    }
  }

  static List<Product> parsePostsForHome(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Product>((json) => Product.fromJson(json)).toList();
  }

  Future<Product> getproductbyid() async {
    Product product;
    var usertoken = token;
    int pid = id;
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
      //print(product.createdat);
      //  birthdate = products[0].createdat;
      //  dateformat = DateFormat.yMd(product.createdat);
      //  print(birthdate);
    }
    return product;
  }
}

class MESSAGES {
  static const String INTERNET_ERROR = "No Internet Connection";
  static const String INTERNET_ERROR_RETRY =
      "No Internet Connection.\nPlease Retry";
}
