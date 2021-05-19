import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:url_launcher/url_launcher.dart';

class ChartsDemo extends StatefulWidget {
  //
  ChartsDemo() : super();

  final String title = "Todays Market Price";

  @override
  ChartsDemoState createState() => ChartsDemoState();
}

class ChartsDemoState extends State<ChartsDemo> {
  //
  List<charts.Series> seriesList;

  static List<charts.Series<Sales, String>> _createRandomData() {
    final random = Random();

    final pettahSalesData = [
      Sales('carrot', random.nextInt(100) + 50),
      Sales('peas', random.nextInt(100) + 50),
      Sales('tomato', random.nextInt(100) + 50),
      Sales('onion', random.nextInt(100) + 50),
      Sales('potato', random.nextInt(100) + 50),
    ];

    final dambullaSalesData = [
      Sales('carrot', random.nextInt(100) + 50),
      Sales('peas', random.nextInt(100) + 50),
      Sales('tomato', random.nextInt(100) + 50),
      Sales('onion', random.nextInt(100) + 50),
      Sales('potato', random.nextInt(100) + 50),
    ];

    final narahenpitaSalesData = [
      Sales('carrot', random.nextInt(100) + 50),
      Sales('peas', random.nextInt(100) + 50),
      Sales('tomato', random.nextInt(100) + 50),
      Sales('onion', random.nextInt(100) + 50),
      Sales('potato', random.nextInt(100) + 50),
    ];

    return [
      charts.Series<Sales, String>(
        id: 'Pettah',
        domainFn: (Sales sales, _) => sales.vegetable,
        measureFn: (Sales sales, _) => sales.salesPrice,
        data: pettahSalesData,
      ),
      charts.Series<Sales, String>(
        id: 'Dambulla',
        domainFn: (Sales sales, _) => sales.vegetable,
        measureFn: (Sales sales, _) => sales.salesPrice,
        data: dambullaSalesData,
      ),
      charts.Series<Sales, String>(
        id: 'Narahenpita',
        domainFn: (Sales sales, _) => sales.vegetable,
        measureFn: (Sales sales, _) => sales.salesPrice,
        data: narahenpitaSalesData,
      ),
    ];
  }

  barChart() {
    return charts.BarChart(
      seriesList,
      animate: true,
      vertical: false,
      barGroupingType: charts.BarGroupingType.grouped,
      behaviors: [
        new charts.SeriesLegend(
          position: charts.BehaviorPosition.end,
          outsideJustification: charts.OutsideJustification.endDrawArea,
          horizontalFirst: false,
          desiredMaxRows: 2,
          cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
          entryTextStyle: charts.TextStyleSpec(
              color: charts.Color(r: 127, g: 63, b: 191),
              fontFamily: 'Georgia',
              fontSize: 11),
        )
      ],
      defaultRenderer: charts.BarRendererConfig(
        groupingType: charts.BarGroupingType.grouped,
        strokeWidthPx: 1.0,
      ),
    );
  }

  _launchPhoneURL(String url) async {
    //String url = 'https://market.ideabeam.com/ta/l/kilinochchi/vegetables/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    seriesList = _createRandomData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      /*   body: Container(
        padding: EdgeInsets.all(20.0),      
        // child: barChart(),
      ),*/
      body: ListView(
        children: [
          ListTile(
              leading: Icon(
                Icons.location_on,
                color: Colors.green,
              ),
              title: InkWell(
                onTap: () {
                  _launchPhoneURL(
                      'https://market.ideabeam.com/ta/l/ampara/vegetables/');
                },
                child: Text("Ampara"),
              )),
          ListTile(
              leading: Icon(
                Icons.location_on,
                color: Colors.green,
              ),
              title: InkWell(
                onTap: () {
                  _launchPhoneURL(
                      'https://market.ideabeam.com/ta/l/kilinochchi/vegetables/');
                },
                child: Text("Anuradhapura"),
              )),
          ListTile(
              leading: Icon(
                Icons.location_on,
                color: Colors.green,
              ),
              title: InkWell(
                onTap: () {
                  _launchPhoneURL(
                      'https://market.ideabeam.com/ta/l/kilinochchi/vegetables/');
                },
                child: Text("Ampara"),
              )),
          ListTile(
              leading: Icon(
                Icons.location_on,
                color: Colors.green,
              ),
              title: InkWell(
                onTap: () {
                  _launchPhoneURL(
                      'https://market.ideabeam.com/ta/l/kilinochchi/vegetables/');
                },
                child: Text("Ampara"),
              )),
          ListTile(
              leading: Icon(
                Icons.location_on,
                color: Colors.green,
              ),
              title: InkWell(
                onTap: () {
                  _launchPhoneURL(
                      'https://market.ideabeam.com/ta/l/kilinochchi/vegetables/');
                },
                child: Text("Ampara"),
              )),
          ListTile(
              leading: Icon(
                Icons.location_on,
                color: Colors.green,
              ),
              title: InkWell(
                onTap: () {
                  _launchPhoneURL(
                      'https://market.ideabeam.com/ta/l/kilinochchi/vegetables/');
                },
                child: Text("Ampara"),
              )),
          ListTile(
              leading: Icon(
                Icons.location_on,
                color: Colors.green,
              ),
              title: InkWell(
                onTap: () {
                  _launchPhoneURL(
                      'https://market.ideabeam.com/ta/l/kilinochchi/vegetables/');
                },
                child: Text("Ampara"),
              )),
          ListTile(
              leading: Icon(
                Icons.location_on,
                color: Colors.green,
              ),
              title: InkWell(
                onTap: () {
                  _launchPhoneURL(
                      'https://market.ideabeam.com/ta/l/kilinochchi/vegetables/');
                },
                child: Text("Ampara"),
              )),
          ListTile(
              leading: Icon(
                Icons.location_on,
                color: Colors.green,
              ),
              title: InkWell(
                onTap: () {
                  _launchPhoneURL(
                      'https://market.ideabeam.com/ta/l/kilinochchi/vegetables/');
                },
                child: Text("Ampara"),
              )),
          ListTile(
              leading: Icon(
                Icons.location_on,
                color: Colors.green,
              ),
              title: InkWell(
                onTap: () {
                  _launchPhoneURL(
                      'https://market.ideabeam.com/ta/l/kilinochchi/vegetables/');
                },
                child: Text("Ampara"),
              )),
          ListTile(
              leading: Icon(
                Icons.location_on,
                color: Colors.green,
              ),
              title: InkWell(
                onTap: () {
                  _launchPhoneURL(
                      'https://market.ideabeam.com/ta/l/kilinochchi/vegetables/');
                },
                child: Text("Ampara"),
              )),
          ListTile(
              leading: Icon(
                Icons.location_on,
                color: Colors.green,
              ),
              title: InkWell(
                onTap: () {
                  _launchPhoneURL(
                      'https://market.ideabeam.com/ta/l/kilinochchi/vegetables/');
                },
                child: Text("Ampara"),
              )),
          ListTile(
              leading: Icon(
                Icons.location_on,
                color: Colors.green,
              ),
              title: InkWell(
                onTap: () {
                  _launchPhoneURL(
                      'https://market.ideabeam.com/ta/l/kilinochchi/vegetables/');
                },
                child: Text("Ampara"),
              )),
          ListTile(
              leading: Icon(
                Icons.location_on,
                color: Colors.green,
              ),
              title: InkWell(
                onTap: () {
                  _launchPhoneURL(
                      'https://market.ideabeam.com/ta/l/kilinochchi/vegetables/');
                },
                child: Text("Ampara"),
              )),
          ListTile(
              leading: Icon(
                Icons.location_on,
                color: Colors.green,
              ),
              title: InkWell(
                onTap: () {
                  _launchPhoneURL(
                      'https://market.ideabeam.com/ta/l/kilinochchi/vegetables/');
                },
                child: Text("Ampara"),
              )),
          ListTile(
              leading: Icon(
                Icons.location_on,
                color: Colors.green,
              ),
              title: InkWell(
                onTap: () {
                  _launchPhoneURL(
                      'https://market.ideabeam.com/ta/l/kilinochchi/vegetables/');
                },
                child: Text("Ampara"),
              )),
          ListTile(
              leading: Icon(
                Icons.location_on,
                color: Colors.green,
              ),
              title: InkWell(
                onTap: () {
                  _launchPhoneURL(
                      'https://market.ideabeam.com/ta/l/kilinochchi/vegetables/');
                },
                child: Text("Ampara"),
              )),
          ListTile(
              leading: Icon(
                Icons.location_on,
                color: Colors.green,
              ),
              title: InkWell(
                onTap: () {
                  _launchPhoneURL(
                      'https://market.ideabeam.com/ta/l/kilinochchi/vegetables/');
                },
                child: Text("Ampara"),
              )),
          ListTile(
              leading: Icon(
                Icons.location_on,
                color: Colors.green,
              ),
              title: InkWell(
                onTap: () {
                  _launchPhoneURL(
                      'https://market.ideabeam.com/ta/l/kilinochchi/vegetables/');
                },
                child: Text("Ampara"),
              )),
        ],
      ),
    );
  }
}

class Sales {
  final String vegetable;
  final int salesPrice;

  Sales(this.vegetable, this.salesPrice);
}
