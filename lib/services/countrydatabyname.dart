import 'coviddata.dart';
import 'networking.dart';
class CountryData
{
  Future getCountryDataByName(String countryName) async{
    var jsonData = await Networking().networking('https://restcountries.eu/rest/v2/name/$countryName?fullText=true');
    var countryCode = jsonData[0]['alpha2Code'];
    print(countryCode);
    var rawCountryData = CovidData().getData(countryCode);
    return rawCountryData;
  }
}