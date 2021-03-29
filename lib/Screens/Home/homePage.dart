import 'package:farmart_flutter_app/Screens/Pages/Editprofilepage.dart';
import 'package:farmart_flutter_app/Screens/Pages/HistoryPage.dart';
import 'package:farmart_flutter_app/Screens/Pages/Setting.dart';
import 'package:flutter/material.dart';

import 'Homepagebody.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selecteditemindex = 0;
  void _onTapeditem(int index) {
    setState(() {
      _selecteditemindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: null),
          IconButton(icon: Icon(Icons.notifications), onPressed: null)
        ],
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          return Container(
            child: ListView(
              //crossAxisAlignment: CrossAxisAlignment.start,
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Categories",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 450,
                    ),
                    Container(
                      child: RaisedButton(
                        color: Colors.green,
                        onPressed: () {
                          print(MediaQuery.of(context).size.width);
                        },
                        shape: StadiumBorder(),
                        child: Text(
                          "+ Add",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                  width: 300,
                                  height: 220,
                                  color: Colors.grey.withOpacity(0.2),
                                  child: Column(
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Image.asset(
                                          "assets/veg.jpeg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Text(
                                        "Vegetables",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      )
                                    ],
                                  )))),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                  width: 280,
                                  height: 220,
                                  color: Colors.grey.withOpacity(0.2),
                                  child: Column(
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Image.asset(
                                          "assets/fruits2.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Text(
                                        "Fruits",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      )
                                    ],
                                  )))),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text("Recents",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      width: 450,
                    ),
                    Text("Filter by",
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 200,
                    padding: EdgeInsets.all(20.0),
                    child: GridView.count(
                      crossAxisCount: 2,
                      scrollDirection: Axis.vertical,
                      children: List.generate(
                          50,
                          (index) => Container(
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                          color: Colors.grey.withOpacity(0.1))),
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                              )),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return HomePageBody();
        }
      }),
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
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
              leading: Icon(Icons.person_add, color: Colors.green),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (contex) => EditProfilePage()));
              },
            ),
            ListTile(
              title: Text("Settings",
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold)),
              leading: Icon(Icons.settings, color: Colors.green),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingPage()));
              },
            ),
            ListTile(
              title: Text("History",
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold)),
              leading: Icon(Icons.history, color: Colors.green),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (contex) => HistoryPage()));
              },
            ),
            ListTile(
              title: Text("Price Chart",
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold)),
              leading: Icon(Icons.money_rounded, color: Colors.green),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (contex) => EditProfilePage()));
              },
            ),
            ListTile(
              title: Text("Contacts",
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold)),
              leading: Icon(Icons.contacts, color: Colors.green),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (contex) => EditProfilePage()));
              },
            ),
            ListTile(
              title: Text("Help",
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold)),
              leading: Icon(Icons.help, color: Colors.green),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (contex) => EditProfilePage()));
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
    );
  }
}
