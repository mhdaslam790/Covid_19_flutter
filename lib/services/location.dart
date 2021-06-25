import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class CurrentLocation
{
  getLocation() async
  {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position.latitude);
    getCountry(position.latitude,position.longitude);
  }
  Future<void> getCountry(double lan,double long) async
  {
    try {
      var url = Uri.parse(
          'http://api.geonames.org/countryCodeJSON?lat=$lan&lng=$long&username=mhdaslam790');
      http.Response response = await http.get(url);
      if (response.statusCode==200)
        {
          var decodeData = jsonDecode(response.body);
          String countryName = decodeData['countryName'];
          print(countryName);
        }
    }
    catch(e)
    {
      print(e);
    }
  }
}

