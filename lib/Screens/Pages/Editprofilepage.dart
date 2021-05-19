import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fancy_dialog/FancyGif.dart';
import 'package:farmart_flutter_app/Model/user.dart';
import 'package:farmart_flutter_app/Screens/Home/homePage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:fancy_dialog/fancy_dialog.dart';
import 'package:cool_alert/cool_alert.dart';

import '../../costants.dart';

class EditProfilePage extends StatefulWidget {
  final User user;
  final String token;
  EditProfilePage({this.user, this.token});
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  int _selecteditemindex = 0;
  void _onTapeditem(int index) {
    setState(() {
      _selecteditemindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Edit Profile",
          //style: TextStyle(color: Colors.green),
        ),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 600) {
          return ListView(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Center(
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                      child: CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(0.4),
                          radius: 60.0,
                          child: ClipRRect(
                            child: Image.asset(
                              'assets/tomato.jpg',
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(120),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 110),
                      child: Center(
                        child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                            child: IconButton(
                                icon: Icon(
                                  Icons.add_a_photo,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  print(widget.user.email);
                                })),
                      ),
                    ),
                  ],
                ),
              ),
              EditProfilePageField(
                user: widget.user,
                token: widget.token,
              ),
            ],
          );
        } else {
          return ListView(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Center(
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                        child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.4),
                            radius: 60.0,
                            child: ClipRRect(
                              child: Image.asset(
                                'assets/tomato.jpg',
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(120),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 110),
                      child: Center(
                        child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                            child: IconButton(
                                icon: Icon(
                                  Icons.add_a_photo,
                                  color: Colors.white,
                                ),
                                onPressed: () {})),
                      ),
                    ),
                  ],
                ),
              ),
              EditProfilePageField(
                user: widget.user,
                token: widget.token,
              ),
            ],
          );
        }
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selecteditemindex,
        onTap: _onTapeditem,
        selectedItemColor: Colors.green,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: "Wish List",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.car_rental,
            ),
            label: "Transport",
          ),
        ],
      ),
    );
  }
}

class EditProfilePageField extends StatefulWidget {
  final User user;
  final String token;

  const EditProfilePageField({Key key, this.user, this.token})
      : super(key: key);
  @override
  _EditProfilePageFieldState createState() => _EditProfilePageFieldState();
}

class _EditProfilePageFieldState extends State<EditProfilePageField> {
  final _formkey = GlobalKey<FormState>();
  /* TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController uname = TextEditingController();*/
  TextEditingController username = TextEditingController();
  String firsname = "";
  String lname = "";
  String address = "";
  String phone = "";
  String district = "";
  String uname = "";
  Future _profile;
  Future<http.Response> updateProfile() async {
    String protype = "sssss";
    int uid = 5;
    String id = uid.toString();
    String usertoken = widget.token;
    var url = apiBase + ":9000/api/editUser";
    var respose = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $usertoken"
      },
      body: jsonEncode(<String, String>{
        "firstName": widget.user.firstName,
        "contactPrimary": widget.user.contactPrimary,
        "username": widget.user.username,
        "address": widget.user.address,
        "district": widget.user.district,
        "lastName": widget.user.lastName,
      }),
    );

    final res = json.decode(respose.body);
    if (respose.statusCode == 200) {
      /* Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => HomePage(
                    token: token,
                    user: user,
                  )));*/
      Fluttertoast.showToast(msg: "sucesssfully updated");
    } else {
      Fluttertoast.showToast(msg: "Unable to update try again");
    }
    print(res);
    return respose;

    /*final responseJson = json.decode(response.body);
    String message = responseJson["msg"];
    print(response.body.toString());
  }*/
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _profile = updateProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 50,
              child: TextFormField(
                // controller: fname,
                initialValue: widget.user.firstName,
                onChanged: (text) {
                  widget.user.firstName = text;
                },
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    labelText: "Name",
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide())),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter valid data";
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 50,
              child: TextFormField(
                //  controller: lname,
                initialValue: widget.user.lastName,
                onChanged: (text) {
                  widget.user.lastName = text;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    labelText: "Last Name",
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide())),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter valid data";
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 50,
              child: TextFormField(
                //  controller: address,
                initialValue: widget.user.address,
                onChanged: (text) {
                  widget.user.address = text;
                },
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    labelText: "Address",
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide())),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter valid data";
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 50,
              child: TextFormField(
                //    controller: phone,
                initialValue: widget.user.contactPrimary,
                onChanged: (text) {
                  widget.user.contactPrimary = text;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    labelText: "Phone Number",
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide())),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter valid data";
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 50,
              child: TextFormField(
                //   controller: district,
                initialValue: widget.user.district,
                onChanged: (text) {
                  widget.user.district = text;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    labelText: "District",
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide())),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter valid data";
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width - 50,
              child: TextFormField(
                initialValue: widget.user.username,
                onChanged: (text) {
                  widget.user.username = text;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    labelText: "User Name",
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide())),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter valid data";
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 30),
                child: Container(
                  width: 140,
                  height: 50,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.green,
                      onPressed: () {
                        updateProfile();
                        Navigator.pop(context);
                        print(widget.user.username);
                        /*     if (_formkey.currentState.validate()) {
                          CoolAlert.show(
                              context: context,
                              type: CoolAlertType.success,
                              text: "Successfully updated!");
                        } else {
                          CoolAlert.show(
                            context: context,
                            type: CoolAlertType.error,
                            text: "Error!",
                          );
                        }*/
                      },
                      child: Text(
                        "Update",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 30),
                child: Container(
                  width: 140,
                  height: 50,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.grey.withOpacity(0.4),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          )
        ],
      ),
    );
  }
}
