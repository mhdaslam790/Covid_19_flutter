import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class HelpCard extends StatelessWidget {
  const HelpCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              //padding as a fraction of the screen
              left: MediaQuery.of(context).size.width *.4,
              top: 20.0,
            ),
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF60BE93),
                    Color(0xFF1B8D59),
                  ],
                ),
                borderRadius: BorderRadius.circular(20)
            ),
            child: RichText(
              text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'Dial 102 for \n medical help!\n',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )
                    ),
                    TextSpan(
                        text: 'If any symptoms appear',
                        style: TextStyle(
                            color: Colors.white.withOpacity(.6)
                        )
                    )
                  ]
              ),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SvgPicture.asset('assets/icons/nurse.svg'),
          ),
          Positioned(
            left: 350,
              top: 20,
              child: SvgPicture.asset('assets/icons/virus.svg'),
          ),
        ],
      ),
    );
  }
}