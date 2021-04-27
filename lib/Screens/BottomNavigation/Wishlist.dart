import 'package:farmart_flutter_app/Screens/Home/homePage.dart';
import 'package:flutter/material.dart';

import 'Transportpage.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key key}) : super(key: key);
  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
      ),
    );
  }
}
