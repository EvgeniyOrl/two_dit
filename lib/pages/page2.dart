import 'package:flutter/material.dart';
import 'package:two_dit/constants/colors.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Hero(
            transitionOnUserGestures: true,
            tag: "page2",
            child: Container(
              width: double.maxFinite,
              height: 260,
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25))
              ),
              child: Stack(
                children: [
                  Positioned(
                    child: Image.asset("assets/images/helmet.png", scale: 0.76,),
                    left: 15,
                  ),
                  DefaultTextStyle(
                    style: TextStyle(decoration: TextDecoration.none),
                    child: Container(
                      margin: const EdgeInsets.only(top: 40),
                      padding: const EdgeInsets.only(left: 17, right: 15, top: 25, bottom: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Header 3", style: TextStyle(color: Colors.white, fontSize: 27, fontWeight: FontWeight.w700,),),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("3", style: TextStyle(color: Colors.white, fontSize: 70)),
                                    Text("longest", style: TextStyle(color: Colors.white, fontSize: 16,)),
                                    Text("text", style: TextStyle(color: Colors.white, fontSize: 16,)),
                                  ],
                                ),
                                SizedBox(width: 30,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("10", style: TextStyle(color: Colors.white, fontSize: 70, letterSpacing: -10)),
                                    Text("longest text", style: TextStyle(color: Colors.white, fontSize: 16,)),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                Text("Header page 1", style: TextStyle(color: AppColors.textColor2, fontSize: 26, fontWeight: FontWeight.w500),),
                SizedBox(height: 30,),
                Text("Lorem Ipsum is simply dummy "
                    "text of the printing and typesetting industry. "
                    "Lorem Ipsum has been the industry's standard dummy text "
                    "ever since the 1500s, when an unknown printer took a galley "
                    "of type and scrambled it to make a type specimen book. ",
                  style: TextStyle(color: AppColors.textColor2, fontSize: 18),),
                SizedBox(height: 10,),
                Text("It has survived not only five centuries, but also the leap "
                    "into electronic typesetting, remaining essentially unchanged. "
                    "It was popularised in the 1960s with the release of Letraset sheets "
                    "containing Lorem Ipsum passages, and more recently with desktop publishing "
                    "software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: TextStyle(color: AppColors.textColor2, fontSize: 18),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
