import 'package:farmart_flutter_app/Model/user.dart';
import 'dart:convert';

class Data {
  final String token;
  final User user;

  Data({this.token, this.user});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(token: json['token'], user: User.fromJson(json['user']));
  }
}
