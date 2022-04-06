import 'package:care_monitor/Screens/medications_screen.dart';
import 'package:care_monitor/Screens/sample_screen.dart';
import 'package:care_monitor/widgets/base_tab_bar.dart';
import 'package:flutter/material.dart';

class HealthScreen extends StatefulWidget {
  const HealthScreen({Key? key}) : super(key: key);

  @override
  _HealthScreenState createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: SafeArea(
        child:
        BaseTabBar(
          tabs: [
            Tab(
              text: "Activities",
            ),
            Tab(
              text: "Medications",
            ),
            Tab(
              text: "Resources",
            ),
            Tab(
              text: "Profile",
            ),
          ],
          tabsView: [
            SampleScreen(),
            MedicationScreen(),
            SampleScreen(),
            SampleScreen(),
          ],
        ),
      ),

    );
  }
}
