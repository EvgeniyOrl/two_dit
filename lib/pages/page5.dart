import 'package:flutter/material.dart';
import 'package:two_dit/constants/colors.dart';

class PageFive extends StatelessWidget {
  const PageFive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Page 5", style: TextStyle(color: AppColors.mainColor),),
      ),
    );
  }
}
