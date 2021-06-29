import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myflutter1/screens/home_screen.dart';
import 'package:myflutter1/services/location.dart';




class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getCovidData();
  }

  Future getCovidData()  async
  {
    var covidData = await CurrentLocation().getLocation();
    // Navigator.pushReplacement replace current screen with next screen
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return HomeScreen(covidData: covidData);
    }));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.grey,
          size: 100.0,
        ),
      ),
    );
  }
}