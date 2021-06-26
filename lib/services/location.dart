import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class CurrentLocation
{
 Future getLocation() async
  {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position.latitude);
     var countryName = await getCountry(position.latitude,position.longitude);
     return countryName;
  }
  Future<dynamic> getCountry(double lan,double long) async
  {
    try {
      var url = Uri.parse(
          'http://api.geonames.org/countryCodeJSON?lat=$lan&lng=$long&username=mhdaslam790');
      http.Response response = await http.get(url);
      if (response.statusCode==200)
        {
          var decodeData = jsonDecode(response.body);
          String countryCode = decodeData['countryCode'];
          return countryCode;
        }
      else
        {
          print('body of country '+response.body);
          getCountry(lan, long);
        }
    }
    catch(e)
    {
      print(e);
    }
  }
  Future getData() async
  {
    var countryCode= await getLocation();
    try{
      var url = Uri.parse('https://corona-api.com/countries/$countryCode');
      http.Response response = await http.get(url);
      print(response.statusCode);
      var decodeData = jsonDecode(response.body);
      int name = decodeData['data']['latest_data']['deaths'];
      print(name);
      return decodeData;
    }
    catch(e)
    {
      print(e);
    }
  }
}

