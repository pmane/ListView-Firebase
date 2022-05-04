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
  final List<BarChartGroupData> _result = [];

  @override
  void initState() {
    super.initState();
    for (var result in widget.bars) {
      print(result.name);
      _result.add(BarChartGroupData(x: 1, barRods: [
        BarChartRodData(
            toY: double.parse(result.price),
            width: 15,
            color: Color(0xff2bdb90)),
      ]));
    }
  }

  @override
  void dispose() {
    // DO YOUR STUFF
    super.dispose();
  }

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
            barGroups: _result)),
      ),
    );
  }
}
