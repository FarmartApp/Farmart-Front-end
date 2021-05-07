import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.portrait) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Order"),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: ListView(
          children: [
            Container(
              height: 150,
              child: Card(
                  elevation: 10,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Image.asset(
                          "assets/tomato.jpg",
                          height: 200,
                          width: 200,
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Column(
                          children: [
                            Text("Name"),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Price"),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: TextFormField(
                    decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your current location',
                ))),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: TextFormField(
                    decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Phone number',
                ))),
          ],
        ),
      );
    }
  }
}
