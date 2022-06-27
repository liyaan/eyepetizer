import 'package:eyepetizer/config/color.dart';
import 'package:flutter/material.dart';

TabBar tabBar({
  TabController controller,
  List<Widget> tabs,
  ValueChanged<int> onTap,
  double fontSize = 14,
  Color labelColor = Colors.black,
  Color unselectedLabelColor = LeoColor.hitTextColor,
  Color indicatorColor = Colors.black,
  TabBarIndicatorSize indicatorSize = TabBarIndicatorSize.label
}){
  return TabBar(
    tabs: tabs,
    isScrollable: false,
    controller: controller,
    onTap: onTap,
    labelColor: labelColor,
    unselectedLabelColor: unselectedLabelColor,
    labelStyle: TextStyle(fontSize: fontSize),
    unselectedLabelStyle: TextStyle(fontSize: fontSize),
    indicatorColor: indicatorColor,
    indicatorSize: indicatorSize,
  );
}