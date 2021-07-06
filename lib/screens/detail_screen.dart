import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';


class DetailScreen extends StatefulWidget {
   final List<double> data;
   final List<String> stringDate;
   final String title;
   DetailScreen({Key? key, required this.data,required this.stringDate,required this.title}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late List<double> value;
  late List<String> stringDate;
  late int number;
  late int activeColor;
  late final String title;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.data,widget.stringDate,widget.title);
  }
  void updateUI(List<double> data,List<String> date,String title)
  {
    stringDate = date;
    value=data;
    number = data[0].toInt();
    activeColor= 0;
    this.title= title;
  }
  getBarGroups(List<double> value){
    List<double> barChartData = value;
    List<BarChartGroupData> barChartGroup = [];
    barChartData.asMap().forEach((key, value) {
      barChartGroup.add(BarChartGroupData(x: key,
          barRods:[
            BarChartRodData(y: value,
                width: 20,
                colors: [key==activeColor ? kPrimaryColor: kInactiveColor])
          ]));
    });
    return barChartGroup;
  }
  String getWeek(double value)  {
    return stringDate[value.toInt()];
    // switch (value.toInt()){
    //   case 0:
    //     return 'MON';
    //   case 1:
    //     return 'TUE';
    //   case 2:
    //     return 'WED';
    //   case 3:
    //     return 'THU';
    //   case 4:
    //     return 'FRY';
    //   case 5:
    //     return 'SAT';
    //   case 6:
    //     return 'SUN';
    //   default:
    //     return '';
    // }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_new,
          color: Theme.of(context).primaryColor,)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
        child:  Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 25),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset:  Offset(0,21),
                    blurRadius: 53,
                    color:  Colors.black.withOpacity(.05),
                  ),
                ],
              ),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(title,style:Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  ),
                  Row(
                    children: <Widget>[
                      Text('$number',style: Theme.of(context).textTheme.headline1!.copyWith(
                        color: Theme.of(context).primaryColor,
                        height: 1.5,
                        fontSize: 50,
                      ),),
                    ],
                  ),
                  Text('From Health center',style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.w300,
                      fontSize: 15),),
                  SizedBox(height: 20,),
                  AspectRatio(aspectRatio: 1.7,
                    child: BarChart(BarChartData(barGroups: getBarGroups(value),
                      borderData: FlBorderData(show: false),
                      barTouchData: BarTouchData(
                          touchCallback: (barTouchResponse){
                            //print(barTouchResponse.spot!.touchedRodData.y);
                            setState(() {
                              number = barTouchResponse.spot!.touchedRodData.y.toInt();
                               activeColor = barTouchResponse.spot!.touchedBarGroupIndex;
                            });
                          }
                      ),
                      titlesData: FlTitlesData(leftTitles: SideTitles(showTitles: false),
                        bottomTitles: SideTitles(showTitles: true,
                          getTitles: getWeek,
                        ),
                      ),
                    ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}





