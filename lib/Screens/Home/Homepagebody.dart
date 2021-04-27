import 'package:farmart_flutter_app/Screens/Home/Fruits.dart';
import 'package:farmart_flutter_app/Screens/Pages/Editprofilepage.dart';
import 'package:farmart_flutter_app/Screens/Pages/OrderPage.dart';
import 'package:farmart_flutter_app/Screens/Product/Addharvest.dart';
import 'package:flutter/material.dart';

import 'DetailsPage.dart';
import 'Vegetales.dart';

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              Text(
                "Categories",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 150,
              ),
              Expanded(
                child: RaisedButton(
                  color: Colors.green,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (contex) => AddHarvestPage()));
                  },
                  shape: StadiumBorder(),
                  child: Text(
                    "+ Add",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => VegetablesView()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 220.0,
                  height: MediaQuery.of(context).size.width - 210.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.withOpacity(0.2))
                      ]),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            "assets/veg.jpeg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Vegetables",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => FruitsView()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 220.0,
                  height: MediaQuery.of(context).size.width - 210.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.withOpacity(0.2))
                      ]),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            "assets/fruits2.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Fruits",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text("Recents",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                width: 220,
              ),
              Text("Filter by", style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
          Expanded(
            child: Container(
              child: GridView.count(
                crossAxisCount: 2,
                scrollDirection: Axis.vertical,
                children: List.generate(
                    1,
                    (index) => //enter list data here
                        _builditem(
                            "assets/potatto.jpeg", "nn", "m", "m", "jj")),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _builditem(String img, String harvestname, String price, String weight,
      String herotag) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DetailsPage(img, harvestname, price, weight, herotag)));
        },
        child: Card(
          child: Stack(
            children: [
              Hero(
                  tag: herotag,
                  child: Image(
                    image: AssetImage(img),
                    height: 100,
                    width: 200,
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding: EdgeInsets.only(right: 5, top: 0),
                child: IconButton(
                  color: Colors.grey[100],
                  icon: Icon(Icons.favorite),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Text(
                      "POtatto",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Text(
                      "200kg",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 120),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Text(
                      "200Rs",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ))
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 140, left: 30),
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      "Click to order",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ))
            ],
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Colors.grey.withOpacity(0.1))),
          color: Colors.grey.withOpacity(0.2),
        ),
      ),
    );
  }
}
