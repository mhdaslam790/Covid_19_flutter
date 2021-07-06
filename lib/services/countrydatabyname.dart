import 'package:myflutter1/services/listdata.dart';
import 'coviddata.dart';
import 'networking.dart';
class CountryDataByName
{
  Future getCountryDataByName(String countryName) async{
    var jsonData = await Networking().networking('https://restcountries.eu/rest/v2/name/$countryName?fullText=true');
    var countryCode = jsonData[0]['alpha2Code'];
    ListData rawCountryData = await CovidData().getData(countryCode);
    return rawCountryData;
  }
}