import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final img;
  final harvestname;
  final price;
  final weight;
  final herotag;
  DetailsPage(
      this.img, this.harvestname, this.price, this.weight, this.herotag);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          "Details",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
              Positioned(
                  top: 75,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  )),
              Positioned(
                  top: 30,
                  left: MediaQuery.of(context).size.width / 2 - 100,
                  child: Hero(
                      tag: widget.herotag,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                                image: AssetImage(widget.img),
                                fit: BoxFit.cover)),
                        height: 200,
                        width: 200,
                      ))),
              Container(
                padding: EdgeInsets.only(top: 250, left: 20),
                child: Column(
                  children: <Widget>[
                    Row(children: <Widget>[
                      Text(
                        widget.harvestname,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        widget.price,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Container(
                        height: 25,
                        width: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        widget.weight,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            color: Colors.grey),
                      ),
                    ]),
                    SizedBox(
                      height: 40,
                    ),
                    Row(children: <Widget>[
                      Text(
                        "Ownwer: ",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      Text(
                        "location",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                    ]),
                    SizedBox(
                      height: 100,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: 150,
                          height: 50,
                          child: RaisedButton(
                              color: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text(
                                "Order",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {}),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          width: 150,
                          height: 50,
                          child: RaisedButton(
                              color: Colors.grey,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text(
                                "Cancel",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {}),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
