import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import '../../costants.dart';

class AddTransport extends StatefulWidget {
  @override
  _AddTransportState createState() => _AddTransportState();
}

class _AddTransportState extends State<AddTransport> {
  TextEditingController vehicletype = TextEditingController();
  TextEditingController vehiclenum = TextEditingController();
  TextEditingController weightcon = TextEditingController();
  TextEditingController amountcon = TextEditingController();

  Future<http.Response> addTranport() async {
    String protype = "sssss";
    int uid = 5;
    String id = uid.toString();
    String usertoken = tokenforuser;
    var url = apiBase + ":9000/api/transport";
    var respose = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $usertoken"
      },
      body: jsonEncode(<String, String>{
        'vehicleModel': vehicletype.text,
        'vehicleNo': vehiclenum.text,
        'amount': amountcon.text,
        'weight': weightcon.text
      }),
    );
    print(respose.statusCode);
    final res = json.decode(respose.body);
    if (respose.statusCode == 200) {
      /* Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => HomePage(
                    token: token,
                    user: user,
                  )));*/
      Fluttertoast.showToast(msg: "sucesssfully added");
    } else {
      Fluttertoast.showToast(msg: "Unable to add try again");
    }
    print(res);
    return respose;

    /*final responseJson = json.decode(response.body);
    String message = responseJson["msg"];
    print(response.body.toString());
  }*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register as transporter"),
      ),
      body: ListView(
        children: [
          Container(
              height: 200,
              width: 300,
              child: Image.asset("assets/vehicle1.jpg")),
          /* Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextFormField(
                  decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Your Name',
              ))),*/
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: TextFormField(
                  controller: vehicletype,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Vehicle type',
                  ))),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: TextFormField(
                  controller: vehiclenum,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Vehicle Number',
                  ))),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: TextFormField(
                  controller: weightcon,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Weight',
                  ))),
          /* Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: TextFormField(
                  decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Contact Number',
              ))),*/
          /* Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: TextFormField(
                  decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'District',
              ))),*/
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: TextFormField(
                  controller: amountcon,
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
                          addTranport();
                          print(tokenforuser);
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
