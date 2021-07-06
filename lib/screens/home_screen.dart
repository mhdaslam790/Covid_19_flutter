import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myflutter1/constants.dart';
import 'package:myflutter1/services/detailScreenData.dart';
import 'package:myflutter1/screens/detail_screen.dart';
import 'package:myflutter1/services/countrydatabyname.dart';
import 'package:myflutter1/services/listdata.dart';
import 'package:myflutter1/services/location.dart';
import 'package:myflutter1/widgets/info_card.dart';
import 'package:myflutter1/widgets/prevention_card.dart';
import '../widgets/help_card.dart';



class HomeScreen extends StatefulWidget {
  final ListData covidData;

  const HomeScreen({Key? key, required this.covidData}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final myController = TextEditingController();
  late int confirmedCase;
  late int totalDeath;
  late int totalRecovery;
  late int newCase;
  late String country;
  late bool check=false;
  List<double> dailyConfirmedCases = [];
  List<double> dailyRecoveryCases = [];
  List<double> dailyDeathCases = [];
  List<double> dailyActiveCases = [];
  List<String> stringDate = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.covidData.decodeData);
    updateDetailScreen(widget.covidData.data);

  }
  void updateUI(dynamic covidData) async
  {
   setState(() {
     confirmedCase = covidData['data']['latest_data']['confirmed'];
     totalDeath = covidData['data']['latest_data']['deaths'];
     totalRecovery = covidData['data']['latest_data']['recovered'];
     newCase = covidData['data']['today']['confirmed'];
     country = covidData['data']['name'];
   });
  }
  void updateDetailScreen(List<DetailScreenData> confirmed)
  {
    dailyConfirmedCases.clear();
    dailyRecoveryCases.clear();
    dailyDeathCases.clear();
    dailyActiveCases.clear();
    stringDate.clear();
    for(int i=0;i<confirmed.length;i++)
    {
      dailyConfirmedCases.add(confirmed[i].dailyConfirmedCases.toDouble());
      dailyRecoveryCases.add(confirmed[i].dailyRecoveryCases.toDouble());
      dailyDeathCases.add(confirmed[i].dailyDeathCases.toDouble());
      dailyActiveCases.add(confirmed[i].dailyActiveCases.toDouble());
      stringDate.add(confirmed[i].dateTime);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: kPrimaryColor),
        elevation: 0,
        backgroundColor: kPrimaryColor.withOpacity(.03),
        actions: <Widget>[
          IconButton(onPressed: (){
            showCupertinoDialog(context: context, 
                builder: (BuildContext context)=> AlertDialog(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  title: Text('Enter Country Name',
                  style: TextStyle(
                    color:  kTextMediumColor,
                  ),
                  ),
                  content:
                      TextField(
                        // onChanged: (value){
                        //   countryName = value;
                        //   print(countryName);
                        // },
                        controller: myController,
                        cursorColor: kPrimaryColor,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color:kPrimaryColor,
                            )
                          ),
                          labelText: 'Country Name',
                          labelStyle: TextStyle(
                            color: kTextMediumColor,
                          ),
                        ),
                      ),
                  actions: [
                    TextButton(onPressed:  () async {
                      ListData dataByCountryName = await CountryDataByName().getCountryDataByName(myController.text);
                          updateUI(dataByCountryName.decodeData);
                          updateDetailScreen(dataByCountryName.data);
                      Navigator.pop(context);
                    },
                        child:Text('OK',
                        style: TextStyle(
                          color: kPrimaryColor,
                          ),
                        ),
                    ),
                    TextButton(onPressed: (){
                      Navigator.pop(context, 'Cancel');
                    },
                        child: Text('cancel',
                        style: TextStyle(
                          color: kPrimaryColor,
                        ),),)
                  ],
                ),

            );
          },
              icon: SvgPicture.asset("assets/icons/search.svg"))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:  <Widget>[
            Container(
              height: 150,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  border: Border(
                  ),
                  color: kPrimaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 5),
                  child: Text(
                    'Drawer Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('My Location Status'),
              onTap: () async {
                ListData locationData = await CurrentLocation().getLocation();
                updateUI(locationData.decodeData);
                updateDetailScreen(locationData.data);
                Navigator.pop(context);
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.settings),
            //   title: Text('Settings'),
            // ),
            // ListTile(
            //   leading: Icon(Icons.settings),
            //   title: Text('Settings'),
            // ),

          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            Container(
              padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(.03),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Wrap(
                runSpacing: 20,
                spacing: 20,
                alignment: WrapAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  RichText(text: TextSpan(
                      style: TextStyle(
                        color: kTextColor,
                      ),
                      children: [
                        TextSpan(
                          text: 'Country Name: ',
                          style:Theme.of(context).textTheme.headline1,
                        ),
                        TextSpan(
                          text: country,
                          style: Theme.of(context).textTheme.headline1,
                        )
                      ]
                  ),
                  ),
                  InfoCard(title: 'Confirmed Cases',number: confirmedCase,color: Color(0xFFFF9C00),function: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) =>   DetailScreen(data: dailyConfirmedCases,stringDate: stringDate,title: 'Daily Confirmed Cases',)));}),
                  InfoCard(title: 'Total Death',number: totalDeath,color: Color(0xFFFF2D55),function: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) =>   DetailScreen(data: dailyDeathCases,stringDate: stringDate,title: 'Daily Death Cases',)));}),
                  InfoCard(title: 'Total Recovered',number: totalRecovery,color: Color(0xFF50E3C2),function: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) =>   DetailScreen(data: dailyRecoveryCases,stringDate: stringDate,title: 'Daily Recovery Cases')));}),
                  InfoCard(title: 'New Cases',number: newCase,color: Color(0xFF5856D6),function: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) =>   DetailScreen(data: dailyActiveCases,stringDate: stringDate,title: 'Daily Active Cases',)));},),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Column(
                children: <Widget>[
                  Text('Preventions',
                    style: Theme.of(context).textTheme.headline1,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        PreventionCard(image: 'assets/icons/Clean_Disinfect.svg',title:'Clean Disinfect',),
                        PreventionCard(image: 'assets/icons/hand_wash.svg',title:'Wash Hands',),
                        PreventionCard(image: 'assets/icons/use_mask.svg',title:'Wear Mask',),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  HelpCard()
                ]
            ),
          ],
        ),
      ),
    );
  }
}




