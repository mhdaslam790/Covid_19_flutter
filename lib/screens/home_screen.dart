import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myflutter1/constants.dart';
import 'package:myflutter1/screens/detail_screen.dart';
import 'package:myflutter1/services/countrydatabyname.dart';
import 'package:myflutter1/widgets/info_card.dart';
import 'package:myflutter1/widgets/prevention_card.dart';
import '../widgets/help_card.dart';



class HomeScreen extends StatefulWidget {
  final covidData;
  const HomeScreen({Key? key, this.covidData}) : super(key: key);

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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.covidData);

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor.withOpacity(.03),
        leading: IconButton(onPressed: (){}, icon:  SvgPicture.asset("assets/icons/menu.svg")),
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
                      var dataByCountryName = await CountryData().getCountryDataByName(myController.text);
                      if(dataByCountryName!=null)
                        {
                          updateUI(dataByCountryName);
                        }
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
          }, icon: SvgPicture.asset("assets/icons/search.svg"))

        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
                children: <Widget>[
                  InfoCard(title: 'Confirmed Cases',number: confirmedCase,color: Color(0xFFFF9C00),function: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) =>   DetailScreen()));}),
                  InfoCard(title: 'Total Death',number: totalDeath,color: Color(0xFFFF2D55),function: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) =>   DetailScreen()));}),
                  InfoCard(title: 'Total Recovered',number: totalRecovery,color: Color(0xFF50E3C2),function: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) =>   DetailScreen()));}),
                  InfoCard(title: 'New Cases',number: newCase,color: Color(0xFF5856D6),function: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) =>   DetailScreen()));},),


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




