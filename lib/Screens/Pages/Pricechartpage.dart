import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartsDemo extends StatefulWidget {
  //
  ChartsDemo() : super();

  final String title = "Vegetables Price Chart";

  @override
  ChartsDemoState createState() => ChartsDemoState();
}

class ChartsDemoState extends State<ChartsDemo> {
  //
  List<charts.Series> seriesList;

  static List<charts.Series<Sales, String>> _createRandomData() {
    final random = Random();

    final yesterdaySalesData = [
      Sales('carrot', random.nextInt(200) + 50),
      Sales('peas', random.nextInt(150) + 50),
      Sales('tomato', random.nextInt(200) + 50),
      Sales('onion', random.nextInt(150) + 50),
      Sales('potato', random.nextInt(150) + 50),
    ];

    final todaySalesData = [
      Sales('carrot', random.nextInt(200) + 50),
      Sales('peas', random.nextInt(150) + 50),
      Sales('tomato', random.nextInt(200) + 50),
      Sales('onion', random.nextInt(150) + 50),
      Sales('potato', random.nextInt(150) + 50),
    ];

    return [
      charts.Series<Sales, String>(
        id: 'Yesterday',
        domainFn: (Sales sales, _) => sales.vegetable,
        measureFn: (Sales sales, _) => sales.salesPrice,
        data: yesterdaySalesData,
      ),
      charts.Series<Sales, String>(
        id: 'Today',
        domainFn: (Sales sales, _) => sales.vegetable,
        measureFn: (Sales sales, _) => sales.salesPrice,
        data: todaySalesData,
      ),
    ];
  }

  barChart() {
    return charts.BarChart(
      seriesList,
      animate: true,
      vertical: false,
      barGroupingType: charts.BarGroupingType.grouped,
      // Add the legend behavior to the chart to turn on legends.
      // This example shows how to change the position and justification of
      // the legend, in addition to altering the max rows and padding.
      behaviors: [
        new charts.SeriesLegend(
          // Positions for "start" and "end" will be left and right respectively
          // for widgets with a build context that has directionality ltr.
          // For rtl, "start" and "end" will be right and left respectively.
          // Since this example has directionality of ltr, the legend is
          // positioned on the right side of the chart.
          position: charts.BehaviorPosition.end,
          // For a legend that is positioned on the left or right of the chart,
          // setting the justification for [endDrawArea] is aligned to the
          // bottom of the chart draw area.
          outsideJustification: charts.OutsideJustification.endDrawArea,
          // By default, if the position of the chart is on the left or right of
          // the chart, [horizontalFirst] is set to false. This means that the
          // legend entries will grow as new rows first instead of a new column.
          horizontalFirst: false,
          // By setting this value to 2, the legend entries will grow up to two
          // rows before adding a new column.
          desiredMaxRows: 2,
          // This defines the padding around each legend entry.
          cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
          // Render the legend entry text with custom styles.
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
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: barChart(),
      ),
    );
  }
}

class Sales {
  final String vegetable;
  final int salesPrice;

  Sales(this.vegetable, this.salesPrice);
}
