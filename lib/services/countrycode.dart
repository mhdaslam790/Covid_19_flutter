import 'networking.dart';
class GetCountryCode {
  Future<dynamic> getCountryCode(double lan,double long) async
  {
    var decodeData = await Networking().networking('http://api.geonames.org/countryCodeJSON?lat=$lan&lng=$long&username=mhdaslam790');
    String countryCode = decodeData['countryCode'];
    return countryCode;
  }
}