import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class VerticalBarChart extends StatelessWidget {
  final List data;

  VerticalBarChart(this.data);


  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      _createSeriesList(data),
      animate: false,
    );
  }

 List<charts.Series<dynamic, String>> _createSeriesList(dynamic data) {
    return [
      charts.Series<dynamic, String>(
        id: 'chart',
        domainFn: (dynamic data, _) => data['name'],
        measureFn: (dynamic data, _) => data['value'],
        data: data,
      ),
    ];
  }
}