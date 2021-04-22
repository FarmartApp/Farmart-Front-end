import 'package:farmart_flutter_app/Screens/Pages/OrderPage.dart';
import 'package:flutter/material.dart';

class VegView extends StatefulWidget {
  @override
  _VegViewState createState() => _VegViewState();
}

class _VegViewState extends State<VegView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: () {}),
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.verified),
                  title: const Text('Farmer name'),
                  subtitle: Text(
                    'location',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Weight:200kg',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, right: 30),
                          child: Text(
                            'price:200rs',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Hero(
                          tag: "hero",
                          child: Image(
                            image: AssetImage("assets/nan.jpg"),
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
                            "nhh",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "6666",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "222",
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
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.grey.shade600,
                        ),
                        onPressed: () {}),
                    SizedBox(
                      width: 200,
                    ),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.green,
                      onPressed: () {
                        // Perform some action
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    OrderPage()));
                      },
                      child: const Text('order'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.verified),
                  title: const Text('Farmer name'),
                  subtitle: Text(
                    'location',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Weight:200kg',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'price:200rs',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Image.asset('assets/nan.jpg',
                      width: 400,
                      //height: size.height * 0.4,
                      fit: BoxFit.contain),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.grey.shade600,
                        ),
                        onPressed: () {}),
                    SizedBox(
                      width: 200,
                    ),
                    FlatButton(
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        // Perform some action
                      },
                      child: const Text('order'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.verified),
                  title: const Text('Farmer name'),
                  subtitle: Text(
                    'location',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'Weight:200kg',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'price:200rs',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Image.asset(
                  'assets/tomato.jpg',
                  width: 400,
                  fit: BoxFit.contain,
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.grey.shade600,
                        ),
                        onPressed: () {}),
                    SizedBox(
                      width: 200,
                    ),
                    FlatButton(
                      color: Colors.green,
                      onPressed: () {
                        // Perform some action
                      },
                      child: const Text('order'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
