import 'package:care_monitor/Screens/add_new_medications.dart';
import 'package:care_monitor/Screens/health_screen.dart';
import 'package:care_monitor/Screens/sample_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Models/medication_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final PageController _pageController = PageController();

  Future<bool> onWillPop() async {
    await showExitDialog();
    return true;
  }

  showExitDialog() {
    showDialog(
      // backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Exit App"),
            content: Text("Are you sure, you want to exit this app?"),
            actions: [
              ButtonTheme(
                hoverColor: Colors.blue[200],
                child: TextButton(
                    onPressed: () {
                      SystemChannels.platform
                          .invokeMethod('SystemNavigator.pop');
                      // Navigator.pop(context);
                    },
                    child: Text("Yes")),
              ),
              ButtonTheme(
                focusColor: Colors.blue[200],
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("No")),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {



    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("My Health", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),),
          actions: [
            InkWell(
              onTap: (){
                Data medicationItem = Data();
                Get.to(AddNewMedicatinos("Add",medicationItem, -1 ));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  children: [
                    Text("Add New", style: TextStyle(color: Colors.black),),
                    SizedBox(width: 10,),
                    Icon(Icons.add_circle, color: Colors.blue,size: 35,)
                  ],
                ),
              ),
            )
          ],

        ),

        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          // onPageChanged: (index){
          //   _bottomNavigationKey.currentState!.setPage(index);
          // },
  controller: _pageController,
  children: [
        HealthScreen(),
        SampleScreen(),
        SampleScreen(),
        SampleScreen(),
        SampleScreen(),
],
        ),


        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CurvedNavigationBar(
              key: _bottomNavigationKey,
              index: 0,
              height: 45.h,
              animationCurve: Curves.easeInOut,
              animationDuration: Duration(milliseconds: 600),
              onTap: (index) {
                _pageController.animateToPage(index,
                    curve: Curves.ease, duration: Duration(milliseconds: 300));
              },
              letIndexChange: (index) => true,
              backgroundColor: Colors.grey.shade200,
              items: <Widget>[
                Icon(Icons.favorite_outlined, size: 30),
                Icon(Icons.calendar_today_outlined, size: 30),
                Icon(Icons.add_circle, size: 45, color: Colors.blue,),
                Icon(Icons.person, size: 30),
                Icon(Icons.chat, size: 30),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                      "Health",
                      textAlign: TextAlign.center,
                    )),
                Expanded(child: Text("Calender", textAlign: TextAlign.center)),
                Expanded(child: Text("Activity", textAlign: TextAlign.center)),
                Expanded(child: Text("Team", textAlign: TextAlign.center)),
                Expanded(child: Text("Chat", textAlign: TextAlign.center)),

              ],
            ),
          ],
        ),


      ),
    );
  }
}
