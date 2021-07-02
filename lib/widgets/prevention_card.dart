import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class PreventionCard extends StatelessWidget {
  final String title;
  final String image;
  const PreventionCard({
    Key? key, required this.title, required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SvgPicture.asset(image),
        SizedBox(
          height: 5,
        ),
        Text(title,
          style: TextStyle(color: kPrimaryColor,
              fontWeight: FontWeight.bold),)
      ],
    );
  }
}