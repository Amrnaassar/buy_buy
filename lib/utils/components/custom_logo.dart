import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const   Expanded(
        child: Stack(
            alignment: Alignment.center,
            children: [
                Image(image: AssetImage('assets/icons/logo.png')),
          Positioned(
            bottom: 0,
            child: Text(
              'buy buy',
              style: TextStyle(
                  fontFamily: 'GowunBatang',
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600),
            ),
          )
        ]));
  }
}
