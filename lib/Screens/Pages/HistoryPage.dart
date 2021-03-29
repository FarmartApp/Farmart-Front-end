import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("View Orders"),
            onTap: () {},
            trailing: Icon(Icons.arrow_right),
          ),
          ListTile(
            title: Text("View Sold Items"),
            onTap: () {},
            trailing: Icon(Icons.arrow_right),
          )
        ],
      ),
    );
  }
}
