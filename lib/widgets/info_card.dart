import 'package:flutter/material.dart';
import 'package:myflutter1/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
class InfoCard extends StatelessWidget {
  final String title;
  final int number;
  final Color color;
  final void Function() function;

  const InfoCard({
    required this.title, required this.number, required this.color, required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          return GestureDetector(
            onTap: function,
            child: Container(
              width: constraints.maxWidth/2 -10,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: color.withOpacity(.12),
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset("assets/icons/running.svg",
                            height: 12,
                            width: 12,
                            color: color,
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text(title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: <Widget>[

                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: RichText(text: TextSpan(
                              style:TextStyle(
                                color: kTextColor,
                              ),
                              children:[ TextSpan(
                                text:  '$number\n',
                                style:  Theme.of(context).textTheme.headline1,
                              ),
                                TextSpan(
                                  text: 'people',
                                  style: Theme.of(context).textTheme.headline2,
                                )
                              ]
                          ),
                          ),
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}
