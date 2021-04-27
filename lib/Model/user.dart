import 'dart:convert';

User UserFromJson(String str) => User.fromJson(json.decode(str));

String UserToJson(User data) => json.encode(data.toJson());

class User {
  int id;
  String firstName; 
  String primary_contact;
  String password;
  String email;

  User(
      {this.id,
      this.firstName,      
      this.primary_contact,
      this.password,
      this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],      
      email: json['email'],
      primary_contact: json['primary_contact'],
      password: json['password'],
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,        
        "email": email,
        "primary_contact": primary_contact,
        "password": password
      };
}
