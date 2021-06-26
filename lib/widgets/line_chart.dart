import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:myflutter1/constants.dart';

class LineReportChart extends StatelessWidget {
  List<FlSpot> getSports() {
    return [
       FlSpot(0, 26948874%100000),
       FlSpot(1, 27157795%100000),
       FlSpot(2, 27369093%100000),
       FlSpot(3, 27555457%100000),
       FlSpot(4, 2729247%100000),
       FlSpot(5, 27894800%100000),
       FlSpot(6, 28894800%100000),
       FlSpot(7, 29894800%100000),
      FlSpot(8, 31894800%100000),
      FlSpot(9, 33894800%100000),
      //  FlSpot(7, 1.7),
      // FlSpot(8, 1),
      // FlSpot(9, 2.8),
      // FlSpot(10, 2.5),
      // FlSpot(11, 2.65),
    ];

  }
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.2,
      child: LineChart(
          LineChartData(
              gridData: FlGridData(show: false),
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(show: false),
              lineBarsData:[ LineChartBarData(
                spots: getSports(),
                isCurved: true,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(show: false),
                colors: [kPrimaryColor],
                barWidth: 4,
              )]
          )),
    );
  }
}

