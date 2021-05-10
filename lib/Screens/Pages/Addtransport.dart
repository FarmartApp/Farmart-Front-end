import 'package:flutter/material.dart';

class AddTransport extends StatefulWidget {
  @override
  _AddTransportState createState() => _AddTransportState();
}

class _AddTransportState extends State<AddTransport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Container(
              height: 200,
              width: 300,
              child: Image.asset("assets/vehicle1.jpg")),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                  decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Your Name',
              ))),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: TextFormField(
                  decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Vehicle type',
              ))),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: TextFormField(
                  decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Vehicle Number',
              ))),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: TextFormField(
                  decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Contact Number',
              ))),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: TextFormField(
                  decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'District',
              ))),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: TextFormField(
                  decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Description about your service(price)',
              ))),
          SizedBox(
            height: 50,
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
                        child: Text("Register",
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          /*  Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TransportPage()));*/
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
