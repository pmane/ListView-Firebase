// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class FLBarChartWidget extends StatefulWidget {
  const FLBarChartWidget({
    Key key,
    this.width,
    this.height,
    this.bars,
  }) : super(key: key);

  final double width;
  final double height;
  final List<CoinListRecord> bars;

  @override
  _FLBarChartWidgetState createState() => _FLBarChartWidgetState();
}

class _FLBarChartWidgetState extends State<FLBarChartWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bar Chart example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: BarChart(BarChartData(
            borderData: FlBorderData(
                border: const Border(
              top: BorderSide.none,
              right: BorderSide.none,
              left: BorderSide(width: 1),
              bottom: BorderSide(width: 1),
            )),
            groupsSpace: 10,
            barGroups: [
              BarChartGroupData(x: 1, barRods: [
                BarChartRodData(toY: 10, width: 15, color: Color(0xff2bdb90)),
              ]),
              BarChartGroupData(x: 2, barRods: [
                BarChartRodData(toY: 9, width: 15, color: Color(0xff2bdb90)),
              ]),
              BarChartGroupData(x: 3, barRods: [
                BarChartRodData(toY: 4, width: 15, color: Color(0xff2bdb90)),
              ]),
              BarChartGroupData(x: 4, barRods: [
                BarChartRodData(toY: 2, width: 15, color: Color(0xff2bdb90)),
              ]),
              BarChartGroupData(x: 5, barRods: [
                BarChartRodData(toY: 13, width: 15, color: Color(0xff2bdb90)),
              ]),
              BarChartGroupData(x: 6, barRods: [
                BarChartRodData(toY: 17, width: 15, color: Color(0xff2bdb90)),
              ]),
              BarChartGroupData(x: 7, barRods: [
                BarChartRodData(toY: 19, width: 15, color: Color(0xff2bdb90)),
              ]),
              BarChartGroupData(x: 8, barRods: [
                BarChartRodData(toY: 21, width: 15, color: Color(0xff2bdb90)),
              ]),
            ])),
      ),
    );
  }
}
