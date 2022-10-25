import 'package:flutter/material.dart';
import 'package:two_dit/constants/colors.dart';
import 'package:two_dit/pages/home_page.dart';
import 'package:two_dit/pages/nav_menu.dart';
import 'package:two_dit/pages/page2.dart';
import 'package:two_dit/pages/page3.dart';
import 'package:two_dit/pages/page4.dart';
import 'package:two_dit/pages/page5.dart';

class MainPage extends StatefulWidget {
  final int pageIndex;
  const MainPage({Key? key, required this.pageIndex}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {

  late AnimationController controller;
  bool isClicked = false;
  bool navClose = true;
  late int currentIndex = widget.pageIndex;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(
        milliseconds: 800,
      ),
      vsync: this,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List pages = [HomePage(), PageTwo(), PageThree(), PageFour(), PageFive()];

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          fit: StackFit.expand,
          children: [
            navClose ? pages[currentIndex] : NavMenu(),
            Positioned(
              top: 60,
              right: 16,
              child: IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    !isClicked ? controller.forward() : controller.reverse();
                    isClicked = !isClicked;

                    setState(() {
                      navClose = !navClose;
                    });
                  },
                  icon: AnimatedIcon(
                    size: 50,
                    icon: AnimatedIcons.menu_close,
                    progress: controller,
                    color: (navClose && currentIndex != 1)  ? AppColors.textColor2 : Colors.white,
                  )),
            ),
          ],
        ),
        bottomNavigationBar: navClose ? Container(
          decoration: BoxDecoration(boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 4)
          ]),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            unselectedFontSize: 0,
            selectedFontSize: 0,
            currentIndex: currentIndex,
            selectedItemColor: AppColors.mainColor,
            unselectedItemColor: AppColors.mainColor.withOpacity(0.5),
            selectedLabelStyle:
                TextStyle(fontSize: 10, color: AppColors.textColor2),
            unselectedLabelStyle:
                TextStyle(fontSize: 10, color: AppColors.textColor1),
            showUnselectedLabels: true,
            onTap: onTap,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                  label: "Main", icon: Icon(Icons.home_outlined)),
              BottomNavigationBarItem(
                  label: "Page 2", icon: Icon(Icons.percent)),
              BottomNavigationBarItem(
                  label: "Page 3", icon: Icon(Icons.history_outlined)),
              BottomNavigationBarItem(
                  label: "Page 4", icon: Icon(Icons.account_circle_outlined)),
              BottomNavigationBarItem(
                  label: "Page 5", icon: Icon(Icons.shopping_basket_outlined)),
            ],
          ),
        ) : null);
  }
}
