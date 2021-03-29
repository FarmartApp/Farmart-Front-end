import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
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
        title: Text("Setting"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title:
                Text("Account", style: TextStyle(fontWeight: FontWeight.bold)),
            leading: Icon(Icons.account_box),
            onTap: () {
              // Navigator.push(context,
              //   MaterialPageRoute(builder: (context) => SettingPage()));
            },
            trailing: Icon(Icons.arrow_right),
          ),
          ListTile(
            title:
                Text("Language", style: TextStyle(fontWeight: FontWeight.bold)),
            leading: Icon(Icons.language),
            onTap: () {
              // Navigator.push(context,
              //   MaterialPageRoute(builder: (context) => SettingPage()));
            },
            trailing: Icon(Icons.arrow_right),
          ),
          ListTile(
            title:
                Text("Privacy", style: TextStyle(fontWeight: FontWeight.bold)),
            leading: Icon(
              Icons.privacy_tip,
            ),
            onTap: () {
              // Navigator.push(context,
              //   MaterialPageRoute(builder: (context) => SettingPage()));
            },
            trailing: Icon(Icons.arrow_right),
          ),
          ListTile(
            title: Text("Notifications",
                style: TextStyle(fontWeight: FontWeight.bold)),
            leading: Icon(Icons.notifications),
            onTap: () {
              // Navigator.push(context,
              //   MaterialPageRoute(builder: (context) => SettingPage()));
            },
            trailing: Icon(Icons.arrow_right),
          ),
        ],
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
