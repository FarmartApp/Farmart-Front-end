import 'package:fancy_dialog/FancyGif.dart';
import 'package:farmart_flutter_app/Model/user.dart';
import 'package:farmart_flutter_app/Screens/Home/homePage.dart';
import 'package:flutter/material.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:fancy_dialog/fancy_dialog.dart';
import 'package:cool_alert/cool_alert.dart';

class EditProfilePage extends StatefulWidget {
  final User user;
  EditProfilePage({this.user});
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
                                  Icons.edit,
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
                                  Icons.edit,
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

  const EditProfilePageField({Key key, this.user}) : super(key: key);
  @override
  _EditProfilePageFieldState createState() => _EditProfilePageFieldState();
}

class _EditProfilePageFieldState extends State<EditProfilePageField> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width - 50,
              child: TextFormField(
                initialValue: widget.user.firstName,
                onChanged: (text) {},
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
              height: 70,
              width: MediaQuery.of(context).size.width - 50,
              child: TextFormField(
              //  initialValue: widget.user.lastname,
                onChanged: (text) {
                  //   print();
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
              height: 70,
              width: MediaQuery.of(context).size.width - 50,
              child: TextFormField(
                //     initialValue: widget.user.firstName,
                onChanged: (text) {
                  print(text);
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
              height: 70,
              width: MediaQuery.of(context).size.width - 50,
              child: TextFormField(
                initialValue: widget.user.password,
                onChanged: (text) {
                  print(text);
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
              height: 70,
              width: MediaQuery.of(context).size.width - 50,
              child: TextFormField(
                //      initialValue: widget.user.password,
                onChanged: (text) {
                  print(text);
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
              height: 70,
              width: MediaQuery.of(context).size.width - 50,
              child: TextFormField(
                //     initialValue: widget.user.password,
                onChanged: (text) {
                  print(text);
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
                        if (_formkey.currentState.validate()) {
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
                        }
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
