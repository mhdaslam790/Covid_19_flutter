import 'package:myflutter1/services/listdata.dart';

import 'countrycode.dart';
import 'package:geolocator/geolocator.dart';
import 'coviddata.dart';

class CurrentLocation
{
 Future<dynamic> getLocation() async
  {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      var countryName = await GetCountryCode().getCountryCode(position.latitude, position.longitude);
      ListData locationData = await CovidData().getData(countryName);
      return locationData;
    }
    catch(e)
    {
      print(e);
    }
  }

}

