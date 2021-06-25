import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myflutter1/constants.dart';
import 'package:myflutter1/screens/detail_screen.dart';
import 'package:myflutter1/services/location.dart';
import 'package:myflutter1/widgets/info_card.dart';
import 'package:myflutter1/widgets/prevention_card.dart';
import '../widgets/help_card.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CurrentLocation loc = CurrentLocation();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loc.getLocation();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor.withOpacity(.03),
        leading: IconButton(onPressed: (){}, icon:  SvgPicture.asset("assets/icons/menu.svg")),
        actions: <Widget>[
          IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/icons/search.svg"))

        ],
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
                children: <Widget>[
                  InfoCard(title: 'Confirmed Cases',number: 1233,color: Color(0xFFFF9C00),function: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) =>   DetailScreen()));}),
                  InfoCard(title: 'Total Death',number: 453,color: Color(0xFFFF2D55),function: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) =>   DetailScreen()));}),
                  InfoCard(title: 'Total Recovered',number: 645,color: Color(0xFF50E3C2),function: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) =>   DetailScreen()));}),
                  InfoCard(title: 'New Cases',number: 133,color: Color(0xFF5856D6),function: (){ Navigator.push(context, MaterialPageRoute(builder:  (context) =>   DetailScreen()));},),


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







