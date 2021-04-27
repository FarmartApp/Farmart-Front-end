import 'package:farmart_flutter_app/Screens/Home/homePage.dart';
import 'package:flutter/material.dart';

import 'Wishlist.dart';

class TransportPage extends StatefulWidget {
  @override
  _TransportPageState createState() => _TransportPageState();
}

class _TransportPageState extends State<TransportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
      ),
    );
  }
}
