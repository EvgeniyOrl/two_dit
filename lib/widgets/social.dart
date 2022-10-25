import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:two_dit/constants/colors.dart';

class AppSocial extends StatelessWidget {
  final String iconUrl;
  AppSocial({Key? key, required this.iconUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 66,
      height: 66,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: AppColors.mainColor)
      ),
      child: SvgPicture.asset(iconUrl, color: AppColors.mainColor,)
    );
  }
}
