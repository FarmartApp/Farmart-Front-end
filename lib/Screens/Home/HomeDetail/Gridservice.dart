import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:farmart_flutter_app/Model/product.dart';

import 'package:http/http.dart' as http;

class GridServices {
  String token;

  GridServices(this.token);
  static  String usertoken = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI1IiwiaWF0IjoxNjIwNjA1MTQxLCJleHAiOjE2MzYxNTcxNDF9.VFdHuD-pC717I1vNK9iQ-jhjVcoQkwjdcxJB_zm1haUrHVCMUQTSfpB5Z213SCIHEWV6YsL_UrYqmCayeigcJw";
  static Future<List<Product>> fetchHomeData() async {
    var url = "http://192.168.43.118:9000/api/product";
    final res = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $usertoken"
      },
    );
    if (res.statusCode == 200) {
      List<Product> list = parsePostsForHome(res.body);
      return list;
    } else {
      throw Exception();
    }
  }

  static List<Product> parsePostsForHome(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    var datalist = parsed['data'];
    return datalist.map<Product>((json) => Product.fromJson(json)).toList();
  }
}
