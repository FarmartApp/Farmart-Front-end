import 'package:flutter/material.dart';

class BottomNavigationBarItem extends StatefulWidget {
  @override
  _BottomNavigationBarItemState createState() => _BottomNavigationBarItemState();
}

class _BottomNavigationBarItemState extends State<BottomNavigationBarItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          IconButton(icon: Icon(Icons.home), onPressed: () {}),
          IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
          IconButton(icon: Icon(Icons.car_rental), onPressed: () {}),
        ],
      ),
    );
  }
}
