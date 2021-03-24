import 'package:farmart_flutter_app/Screens/Home/homebody.dart';
import 'package:farmart_flutter_app/costants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'categorylist.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: null),
            IconButton(
                icon: Icon(Icons.notifications, color: Colors.white),
                onPressed: null),
          ],
        ),
        body: Container(
          height: size.height,
          child: Column(
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
              Expanded(
                  child: Stack(
                children: <Widget>[
                  //background

                  Container(
                    margin: EdgeInsets.only(top: 70),
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: kDefaultPadding,
                        vertical: kDefaultPadding / 2),
                    height: 160,
                    //    color: Colors.greenAccent,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        Container(
                          height: 136,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              color: Colors.greenAccent,
                              boxShadow: [kDefaultShadow]),
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(22)),
                          ),
                        ),
                        Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              height: 150,
                              width: 200,
                              child: Image.asset(
                                "assets/potatto.jpeg",
                              ),
                            )),
                        Positioned(
                            bottom: 0,
                            left: 0,
                            child: SizedBox(
                              height: 136,
                              width: size.width - 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: kDefaultPadding),
                                    child: Text(
                                      "Tomato",
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: kDefaultPadding),
                                    child: Text(
                                      "Weight: 200kg",
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: kDefaultPadding * 1.5,
                                        vertical: kDefaultPadding / 4),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(22),
                                            topRight: Radius.circular(22)),
                                        color: Colors.greenAccent),
                                    child: Text(
                                      "Order",
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: kDefaultPadding,
                        vertical: kDefaultPadding / 2),
                    height: 160,
                    //    color: Colors.greenAccent,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        Container(
                          height: 136,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              color: Colors.greenAccent,
                              boxShadow: [kDefaultShadow]),
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(22)),
                          ),
                        ),
                        Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              height: 150,
                              width: 200,
                              child: Image.asset(
                                "assets/tomato.jpg",
                              ),
                            )),
                        Positioned(
                            bottom: 0,
                            left: 0,
                            child: SizedBox(
                              height: 136,
                              width: size.width - 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: kDefaultPadding),
                                    child: Text(
                                      "Tomato",
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: kDefaultPadding),
                                    child: Text(
                                      "Weight: 200kg",
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: kDefaultPadding * 1.5,
                                        vertical: kDefaultPadding / 4),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(22),
                                            topRight: Radius.circular(22)),
                                        color: Colors.greenAccent),
                                    child: Text(
                                      "Rs.100",
                                      style: Theme.of(context).textTheme.button,
                                    ),
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              ))
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
                  //  // Then close the drawer.
                  Navigator.pop(context);
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
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.green,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.green,
                ),
                title: Text(
                  "Wish List",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.car_rental,
                  color: Colors.green,
                ),
                title: Text(
                  "Transporter",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
