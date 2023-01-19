import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:indroscreen/HomePage.dart';
import 'package:indroscreen/indroScreens/indroPage1.dart';
import 'package:indroscreen/indroScreens/indroPage2.dart';
import 'package:indroscreen/indroScreens/indroPage3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ONBOARDINGSCREEN(),
  ));
}

class ONBOARDINGSCREEN extends StatefulWidget {
  const ONBOARDINGSCREEN({super.key});

  @override
  State<ONBOARDINGSCREEN> createState() => _ONBOARDINGSCREENState();
}

class _ONBOARDINGSCREENState extends State<ONBOARDINGSCREEN> {

  //! Controller to keep track which page we' re
  PageController _controller = PageController();

  //! Keeps to check whether the page is last or not
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //! PageView
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                isLastPage = (index == 2);
              });
            },
            children: const [
              IndroScreen1(),
              IndroScreen2(),
              IndroScreen3()
            ],
          ),
          
          Container(
              alignment: const Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //! Skip
                  GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: const Text("Skip"),
                  ),

                  //! Dot Indicator 
                  SmoothPageIndicator(
                    controller: _controller, // PageController
                    count: 3,
                  ),

                  //! Next or Done
                  isLastPage ?
                  GestureDetector(
                    onTap: () {
                      //_controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePAge()));
                    },
                    child: const Text("Done"),
                  ) 

                  :
                  GestureDetector(
                    onTap: () {
                      _controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                    },
                    child: const Text("Next"),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
