import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:myflutter1/constants.dart';


class WeeklyChart extends StatefulWidget {
  final List<double> data;
  WeeklyChart({required this.data});

  @override
  _WeeklyChartState createState() => _WeeklyChartState();
}

class _WeeklyChartState extends State<WeeklyChart> {
  late List<double> value;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.data);

  }
  updateUI(List<double> data)
  {
    value=data;
  }

  @override
  Widget build(BuildContext context) {
    return  AspectRatio(aspectRatio: 1.7,
      child: BarChart(BarChartData(barGroups: getBarGroups(value),
        borderData: FlBorderData(show: false),
        barTouchData: BarTouchData(
          touchCallback: (barTouchResponse){
            print(barTouchResponse.spot!.touchedRodData.y);
          }
        ),
        titlesData: FlTitlesData(leftTitles: SideTitles(showTitles: false),
          bottomTitles: SideTitles(showTitles: true,
            getTitles: getWeek,
          ),
        ),
      ),
      ),
    );
  }
  getBarGroups(List<double> value){
    List<double> barChartData = value;
    // for(i=0;i<value.length;i++)
    //   {
    //     barChartData.add(value[i].dailyConfirmedCases.toDouble());
    //   }
    print(barChartData);

    List<BarChartGroupData> barChartGroup = [];
    barChartData.asMap().forEach((key, value) {
      barChartGroup.add(BarChartGroupData(x: key,
          barRods:[
            BarChartRodData(y: value,
                width: 15,
                colors: [key==4 ? kPrimaryColor: kInactiveColor])
          ]));
    });
    return barChartGroup;
  }
  String getWeek(double value)  {
    switch (value.toInt()){
      case 0:
        return 'MON';
      case 1:
        return 'TUE';
      case 2:
        return 'WED';
      case 3:
        return 'THU';
      case 4:
        return 'FRY';
      case 5:
        return 'SAT';
      case 6:
        return 'SUN';
      default:
        return '';
    }
  }
}



