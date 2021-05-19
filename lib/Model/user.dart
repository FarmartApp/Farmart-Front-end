import 'dart:convert';

User UserFromJson(String str) => User.fromJson(json.decode(str));

String UserToJson(User data) => json.encode(data.toJson());

class User {
  int id;
  String firstName;
  String lastName;
  String district;
  String address;
  String username;
  String contactSecondary;
  String avatar;
  String description;
  String contactPrimary;
  String password;
  String email;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.district,
      this.address,
      this.avatar,
      this.contactPrimary,
      this.contactSecondary,
      this.description,
      this.email,
      this.password,
      this.username});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      email: json['email'],
      lastName: json['lastName'],
      district: json['district'],
      address: json['address'],
      avatar: json['avatar'],
      contactPrimary: json['contactPrimary'],
      contactSecondary: json['contactSecondary'],
      description: json['description'],
      password: json['password'],
      username: json['username'],
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "email": email,
        "contactPrimary": contactPrimary,
        "password": password,
        "username": username,
        "description": description,
        "contactSecondary": contactSecondary,
        "avatar": avatar,
        "address": address,
        "district": district,
        "lastName": lastName,
      };
}
