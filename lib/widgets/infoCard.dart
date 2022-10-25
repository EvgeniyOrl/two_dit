import 'package:flutter/material.dart';
import 'package:two_dit/constants/colors.dart';

class AppInfoCard extends StatelessWidget {
  final String number;
  final String text;
  AppInfoCard({Key? key, required this.number, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 205,
      height: 220,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white
      ),
      padding: const EdgeInsets.only(top: 40, bottom: 16, right: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(number, style: TextStyle(fontSize: 150, color: AppColors.mainColor, letterSpacing: -1, fontFamily: "Bebas Neue", height: 0.8), textAlign: TextAlign.center,),
          Text(text, style: TextStyle(fontSize: 17, color: AppColors.textColor2),)
        ],
      ),
    );
  }
}
