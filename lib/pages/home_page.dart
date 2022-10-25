import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:two_dit/widgets/card.dart';
import 'package:two_dit/widgets/downloadButton.dart';
import 'package:two_dit/widgets/infoCard.dart';
import 'package:two_dit/widgets/social.dart';

import '../constants/colors.dart';
import 'package:two_dit/pages/main_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static List infoCardNumbers = [
    "160",
    "3",
    "55",
    "26"
  ];

  static List infoCardTexts = [
    "Text text text text text text",
    "Text text text",
    "Text text text text text",
    "Text text text text"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16, top: 60),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.mainColor,
              ),
            ),
          ),
          SizedBox(height: 5,),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15,),
                  Container(
                    margin: const EdgeInsets.only(left: 16, right: 15),
                    padding: const EdgeInsets.only(top: 15, right: 10, bottom: 10, left: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.primaryColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Header 1", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
                        SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Header 2", style: TextStyle(fontSize: 18, color: AppColors.textColor1)),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xFF828282),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MyRoute(builder: (context) =>
                              MainPage(pageIndex: 1)));
                    },
                    child: Hero(
                      transitionOnUserGestures: true,
                      tag: "page2",
                      child: Container(
                        width: double.maxFinite,
                        height: 190,
                        margin: const EdgeInsets.only(left: 16, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.mainColor,
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              child: Image.asset("assets/images/helmet.png"),
                              left: 15,
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 17, right: 15, top: 25, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Header 3", style: TextStyle(color: Colors.white, fontSize: 27, fontWeight: FontWeight.w700),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Column(
                                        children: [
                                          Text("3", style: TextStyle(color: Colors.white, fontSize: 70)),
                                          Text("longest", style: TextStyle(color: Colors.white, fontSize: 16,)),
                                          Text("text", style: TextStyle(color: Colors.white, fontSize: 16,))
                                        ],
                                      ),
                                      SizedBox(width: 30,),
                                      Column(
                                        children: [
                                          Text("10", style: TextStyle(color: Colors.white, fontSize: 70, letterSpacing: -10)),
                                          Text("longest", style: TextStyle(color: Colors.white, fontSize: 16,)),
                                          Text("text", style: TextStyle(color: Colors.white, fontSize: 16,))
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    margin: const EdgeInsets.only(left: 16, right: 15),
                    child: AppCard(title: "Header 4-1", imgUrl: "bg1.jpg",),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    margin: const EdgeInsets.only(left: 16, right: 15),
                    child: AppCard(title: "Header 4-2", imgUrl: "bg2.jpg",),
                  ),
                  SizedBox(height: 60,),
                  //List
                  Container(
                    padding: const EdgeInsets.only(top: 30, bottom: 30, left: 16),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Header 5", style: TextStyle(color: AppColors.textColor2, fontSize: 26, fontWeight: FontWeight.w500),),
                        Container(
                          height: 260,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: ListView.builder(
                              itemCount: 4,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return AppInfoCard(number: infoCardNumbers[index], text: infoCardTexts[index]);
                              }
                          ),
                        ),
                        Row(
                          children: [
                            Text("Read more", style: TextStyle(color: AppColors.mainColor, fontSize: 16, fontWeight: FontWeight.w700),),
                            SizedBox(width: 10,),
                            Icon(Icons.keyboard_arrow_right, color: AppColors.mainColor, size: 20,)
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  //Socials
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppSocial(iconUrl: "assets/images/twitter.svg"),
                        AppSocial(iconUrl: "assets/images/instagram.svg"),
                        AppSocial(iconUrl: "assets/images/facebook.svg"),
                        AppSocial(iconUrl: "assets/images/youtube.svg"),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  DownloadButton(),
                  SizedBox(height: 100,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyRoute extends MaterialPageRoute {
  MyRoute({required WidgetBuilder builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => Duration(milliseconds: 600);
}
