import 'package:flutter/material.dart';

import 'OrderPage.dart';

class DetailView extends StatefulWidget {
  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.favorite_rounded,
                color: Colors.grey,
              ),
              onPressed: () {})
        ],
      ),
      body: ListView(
        children: [
          Image.asset("assets/tomato.jpg"),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Tomato",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 4),
            child: Text(
              "Posted On 22 May 2021",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 3),
            child: Text(
              "Colombo",
              //  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.grey,
            thickness: 0.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Rs 200",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.green),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 4),
            child: Text(
              "For sale by",
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 0.0,
          ),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text("Type"),
                  SizedBox(
                    width: 250,
                  ),
                  Text("veg")
                ],
              )),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text("Is Delivery Available"),
                  SizedBox(
                    width: 150,
                  ),
                  Text("Yes")
                ],
              )),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text("For sale by"),
                  SizedBox(
                    width: 220,
                  ),
                  Text("Yes")
                ],
              )),
          Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 14),
              child: Text(
                "Description",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                    width: 160,
                    child: RaisedButton(
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text("Order",
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderPage()));
                        })),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                    width: 160,
                    child: RaisedButton(
                        color: Colors.grey[600],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text("Cancel",
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {})),
              ),
            ],
          )
        ],
      ),
    );
  }
}
