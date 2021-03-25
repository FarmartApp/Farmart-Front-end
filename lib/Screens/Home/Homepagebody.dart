import 'package:flutter/material.dart';

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
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
                width: 200,
              ),
              Expanded(
                child: RaisedButton(
                  color: Colors.green,
                  onPressed: () {},
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
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width - 230.0,
                  height: MediaQuery.of(context).size.width - 230.0,
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
                        height: 20,
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
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width - 230.0,
                  height: MediaQuery.of(context).size.width - 230.0,
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
                            "assets/fruits1.jpg",
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
                    50,
                    (index) => Container(
                          child: Card(
                            color: Colors.grey.withOpacity(0.2),
                          ),
                        )),
              ),
            ),
          )
        ],
      ),
    );
  }
}