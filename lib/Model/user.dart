import 'dart:convert';

User UserFromJson(String str) => User.fromJson(json.decode(str));

String UserToJson(User data) => json.encode(data.toJson());

class User {
  int uid;
  String username;
  String email;
  int phonenum;
  String password;

  User({this.uid, this.username, this.email, this.phonenum, this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'],
      username: json['username'],
      email: json['email'],
      phonenum: json['phonenum'],
      password: json['password'],
    );
  }
  Map<String, dynamic> toJson() => {
        "uid": uid,
        "username": username,
        "email": email,
        "phonenum": phonenum,
        "password": password
      };

  String get username1 => username;
  String get email1 => email;
  int get phonenum1 => phonenum;
  String get password1 => password;
}
