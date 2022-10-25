import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppCard extends StatelessWidget {
  final String title;
  final String imgUrl;
  AppCard({Key? key, required this.title, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      width: double.maxFinite,
      height: 151,
      padding: const EdgeInsets.only(left: 17, right: 10, bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
            image: AssetImage(
                "assets/images/" + imgUrl
            ),
            fit: BoxFit.cover
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: Colors.white, fontSize: 26),),
          Icon(Icons.arrow_right_alt_outlined, size: 60, color: Colors.white,)
        ],
      ),
    );
  }
}
