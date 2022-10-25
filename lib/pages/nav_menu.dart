import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:two_dit/constants/colors.dart';
import 'package:two_dit/pages/main_page.dart';

class NavMenu extends StatefulWidget {
  const NavMenu({Key? key}) : super(key: key);

  @override
  State<NavMenu> createState() => _NavMenuState();
}

class _NavMenuState extends State<NavMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.transparent
        ),
        child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                child: TweenAnimationBuilder(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: Duration(milliseconds: 1000),
                  child: NavMenuContent(),
                  builder: (context,double value,child) {
                    return ShaderMask(shaderCallback: (rect) {
                      return RadialGradient(
                        radius: value * 5,
                        colors: [Colors.white, Colors.white, Colors.transparent, Colors.transparent],
                        stops: [0.0, 0.6, 0.6, 1.0],
                        center: FractionalOffset(0.95, 0.1),
                      ).createShader(rect);
                    },child: child,
                    );
                  },
                ),
              );
            }
        )
    );
  }
}


class NavMenuContent extends StatefulWidget {
  const NavMenuContent({Key? key}) : super(key: key);

  @override
  State<NavMenuContent> createState() => _NavMenuContentState();
}

class _NavMenuContentState extends State<NavMenuContent> {
  int currentLanguage = 0;

  List languages = [
    "RU",
    "EN",
    "DE",
    "TH",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.mainColor
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 60),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white)
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                height: 350,
                child: ListView.builder(
                    padding: EdgeInsets.only(top: 38),
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          margin: const EdgeInsets.only(bottom: 29),
                          child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MainPage(pageIndex: index,)));
                              },
                              child: Text("Page ${index + 1}", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),)));
                    }),
              ),
              SizedBox(height: 100,),
              Container(
                height: 30,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (BuildContext context, int index) {
                      return Center(
                        child: Container(
                          height: 14,
                          width: 1.5,
                          color: Color(0xFF2d5dd9),
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          alignment: Alignment.center,
                        ),
                      );
                    } ,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            currentLanguage = index;
                          });
                        },
                        child: Container(
                            alignment: Alignment.center,
                            child: Text(languages[index],
                              style: TextStyle(
                                  color: (currentLanguage) == index ? Colors.white : Color(0xFF2d5dd9),
                                  fontSize: 18),)),
                      );
                    }),
              ),
              SizedBox(height: 40,),
              Container(
                padding: const EdgeInsets.only(right: 18),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    prefixIconConstraints:BoxConstraints(minWidth: 23, maxHeight: 25),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Icon(Icons.search, color: Colors.white, size:30,),
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 16),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Text("Support", style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 16),)
            ],
          ),
        ),
      ),
    );
  }
}
