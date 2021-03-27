import 'package:farmart_flutter_app/Screens/Home/homebody.dart';
import 'package:farmart_flutter_app/Screens/Pages/Editprofilepage.dart';
import 'package:farmart_flutter_app/costants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'categorylist.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selecteditemindex = 0;
  void _onTapeditem(int index) {
    setState(() {
      _selecteditemindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          title: Text("Farmart"),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                onPressed: null),
          ],
        ),
        body: Container(
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(kDefaultPadding),
                padding: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding, vertical: kDefaultPadding / 4),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Search",
                      hintStyle: TextStyle(color: Colors.white70)),
                ),
              ),
              CategoryList(),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white70.withOpacity(0.4)),
                child: AspectRatio(
                  aspectRatio: 0.693,
                  child: Column(
                    children: <Widget>[
                      AspectRatio(
                        aspectRatio: 1,
                        child: Image.asset(
                          "assets/pumpkin.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Title(
                          color: Colors.black,
                          child: Text(
                            "Pumpkin",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      Text("Rs100")
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                  decoration: BoxDecoration(color: Colors.green),
                  child: Column(
                    children: [
                      Icon(
                        Icons.person,
                        size: 100.0,
                        color: Colors.white,
                      ),
                      Text(
                        "Farmart",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  )),
              ListTile(
                title: Text(
                  "Edit Profile",
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
                leading: Icon(Icons.person_add, color: Colors.green),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              new EditProfilePage()));
                },
              ),
              ListTile(
                title: Text("Settings",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold)),
                leading: Icon(Icons.settings, color: Colors.green),
                onTap: () {
                  //  // Then close the drawer.
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("History",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold)),
                leading: Icon(Icons.history, color: Colors.green),
                onTap: () {
                  //  // Then close the drawer.
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Price Chart",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold)),
                leading: Icon(Icons.money_rounded, color: Colors.green),
                onTap: () {
                  //  // Then close the drawer.
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Contacts",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold)),
                leading: Icon(Icons.contacts, color: Colors.green),
                onTap: () {
                  //  // Then close the drawer.
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Help",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold)),
                leading: Icon(Icons.help, color: Colors.green),
                onTap: () {
                  //  // Then close the drawer.
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
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
      ),
    );
  }
}
