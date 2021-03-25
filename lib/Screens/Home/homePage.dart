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
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: null),
          IconButton(icon: Icon(Icons.notifications), onPressed: null)
        ],
      ),
      body: HomePageBody(),
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
