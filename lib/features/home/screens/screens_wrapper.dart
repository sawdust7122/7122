import 'package:coffee_management/features/home/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreensWrapper extends StatefulWidget {
  const ScreensWrapper({Key? key}) : super(key: key);

  @override
  State<ScreensWrapper> createState() => _ScreensWrapperState();
}

class _ScreensWrapperState extends State<ScreensWrapper> {
  ////////////////////////// init variables
  int currentIndex = 0;
  List<IconData> bottomNavIcons = [
    Icons.home_rounded,
    Icons.bar_chart_rounded,
    CupertinoIcons.cube_box,
    Icons.person,
  ];
  late PageController pageController;
  List<Widget> screens = [
    const HomeScreen(),
    const Center(
      child: Text('1'),
    ),
    const Center(
      child: Text('2'),
    ),
    const Center(
      child: Text('3'),
    ),
  ];
  ////////////////////////// init variables

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey.withOpacity(0.3),
              blurRadius: 30,
              offset: const Offset(0, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(bottomNavIcons.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              behavior: HitTestBehavior.opaque,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 1500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    margin: EdgeInsets.only(
                      bottom: index == currentIndex ? 0 : media.width * .029,
                      right: media.width * .0422,
                      left: media.width * .0422,
                    ),
                    width: media.width * .128,
                    height: index == currentIndex ? media.width * .014 : 0,
                    decoration: const BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(10),
                      ),
                    ),
                  ),
                  Icon(
                    bottomNavIcons[index],
                    size: media.width * .065,
                    color: index == currentIndex
                        ? Colors.blueAccent
                        : Colors.black38,
                  ),
                  SizedBox(height: media.width * .03),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
