import 'dart:ui';

import 'package:care_monitor/Utils/config.dart';
import 'package:flutter/material.dart';

class BaseTabBar extends StatelessWidget {
  final List<Widget> tabs;
  final List<Widget> tabsView;

  const BaseTabBar({Key? key, required this.tabs, required this.tabsView})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TabBar(
          labelPadding: EdgeInsets.zero,
          indicatorPadding: EdgeInsets.zero,
          labelStyle:
          TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
          unselectedLabelColor: Colors.grey,
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
          labelColor: appColor,
          tabs: tabs,
        ),
        Expanded(child: TabBarView(children: tabsView)),
      ],
    );
  }
}
