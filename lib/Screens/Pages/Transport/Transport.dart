import 'package:farmart_flutter_app/Screens/Pages/Transport/TransportDetailsPage.dart';
import 'package:flutter/material.dart';

import '../Addtransport.dart';

class TransportPage extends StatefulWidget {
  @override
  _TransportPageState createState() => _TransportPageState();
}

class _TransportPageState extends State<TransportPage> {
  Color colorss = Colors.black26;
  bool iscolored = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transport"),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddTransport()));
              })
        ],
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width - 160,
            child: TextFormField(
              onChanged: (text) {
                /* setState(() {
                   filteredvegproducts = vegproducts
                      .where((element) => (element.name
                            .toLowerCase()
                            .contains(text.toLowerCase())))
                        .toList();
                  });*/
              },
              decoration: InputDecoration(
                  hintText: "Search here",
                  contentPadding: EdgeInsets.only(left: 18),
                  //  fillColor: Colors.white,
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide())),
            ),
          ),
        ),
        Container(
            height: 100, width: 100, child: Image.asset("assets/vehicle.jpg")),
        Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40))),
            child: ListView(
                scrollDirection: Axis.vertical,

                //  primary: false,
                padding: EdgeInsets.only(left: 15, right: 20),
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 45),
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              //   Product vegitem = filteredvegproducts[index];
                              return Card(
                                  // elevation: 6,
                                  //color: Colors.white38,
                                  child: _builditem(
                                "assets/tomato.jpg",
                                "Name",
                                "Vehile",
                                "weight",
                                "ss",
                              ));
                            }),
                      ))
                ])),
      ]),
    );
  }

  Widget _builditem(String img, String harvestname, String price, String weight,
      String herotag) {
    return Padding(
      padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
      child: InkWell(
        onTap: () {
          /*  Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DetailsPage(img, harvestname, price, weight, herotag)));*/
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Hero(
                      tag: herotag,
                      child: Image(
                        image: AssetImage(img),
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        harvestname,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        price.toString(),
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        weight.toString(),
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  child: InkWell(
                      child: Text(
                        "View Detail->",
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TransportDetailPage()));
                      }),
                ),
                IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: colorss,
                    ),
                    onPressed: () {
                      setState(() {
                        iscolored = (!iscolored);
                      });
                      if (iscolored == false) {
                        colorss = Colors.black26;
                      } else {
                        colorss = Colors.green;
                      }
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
