import 'package:intl/intl.dart';
import 'package:myflutter1/services/detailScreenData.dart';
import 'package:myflutter1/services/listdata.dart';
import 'networking.dart';
class CovidData

{
  Future<ListData> getData(dynamic countryCode) async
  {
    var decodeData = await Networking().networking('https://corona-api.com/countries/$countryCode');
    var newList = getDetailScreenData(decodeData);
    // for(int i=0;i<newList[1].dailyDeathCases.bitLength;i++)
    //   {
    //     print('in body of CovidData${newList[i].dailyDeathCases}');
    //   }
    return ListData(data: newList, decodeData: decodeData);

  }
  // Future<List<DetailScreenData>> getConfirmedData() async{
  //   var decodeData = await Networking().networking('https://corona-api.com/countries/pk');
  //     var newList = getDetailScreenData(decodeData);
  //   return newList;
  //}
   List<DetailScreenData> getDetailScreenData(Map<String,dynamic> json)
  {
    int i=0;
    var data = <DetailScreenData>[];
    for(var item in json['data']['timeline']) {
      data.add(
        DetailScreenData(dailyConfirmedCases: item['new_confirmed'],
            dailyRecoveryCases: item['new_recovered'] ,
            dailyDeathCases: item['new_deaths'] ,
            dailyActiveCases: item['active'] ,
            dateTime:DateFormat("MMMd").format(DateTime.parse(item['date'])) )
      );
      if(i==6)
        {
          break;
        }
      i++;
    }
    return data;
  }
}