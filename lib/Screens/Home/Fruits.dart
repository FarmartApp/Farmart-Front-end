import 'package:farmart_flutter_app/Screens/Pages/OrderPage.dart';
import 'package:flutter/material.dart';

class FruitsView extends StatefulWidget {
  @override
  _FruitsViewState createState() => _FruitsViewState();
}

class _FruitsViewState extends State<FruitsView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.green,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                Container(
                  width: 125,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.search, color: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      IconButton(
                          icon: Icon(Icons.add, color: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.only(left: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Fruits",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                    icon: Icon(Icons.filter_list, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40))),
            child: ListView(
              scrollDirection: Axis.vertical,

              //  primary: false,
              padding: EdgeInsets.only(left: 25, right: 20),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 45),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      // scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Card(
                          elevation: 20,
                          color: Colors.white38,
                          child: _builditem(
                              "assets/tomato.jpg", "Onion", 200, 100, "img1"),
                        ),
                        Card(
                          elevation: 20,
                          color: Colors.white38,
                          child: _builditem(
                              "assets/pumpkin.jpg", "Onion", 200, 100, "img2"),
                        ),
                        Card(
                          elevation: 20,
                          color: Colors.white38,
                          child: _builditem(
                              "assets/potatto.jpeg", "Onion", 200, 100, "img3"),
                        ),
                        Card(
                          elevation: 20,
                          color: Colors.white38,
                          child: _builditem(
                              "assets/tomato.jpg", "Onion", 200, 100, "img4"),
                        ),
                        Card(
                          elevation: 20,
                          color: Colors.white38,
                          child: _builditem(
                              "assets/onion.jpeg", "Onion", 200, 100, "img5"),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _builditem(
      String img, String harvestname, int price, int weight, String herotag) {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: InkWell(
        onTap: () {},
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
                  height: 30,
                  width: 80,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Order",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.green,
                      onPressed: () {}),
                ),
                IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.white54,
                    ),
                    onPressed: () {
                      print(MediaQuery.of(context).size);
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
