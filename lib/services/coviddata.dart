import 'networking.dart';
class CovidData
{
  Future<dynamic> getData(dynamic countryCode) async
  {
    print(countryCode);
    var decodeData = await Networking().networking('https://corona-api.com/countries/$countryCode');
    return decodeData;
  }
}