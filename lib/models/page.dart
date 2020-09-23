import 'package:flutter/material.dart';

class TabData {
  final int index;
  final String title;
  final Widget widget;
  final IconData icon;
  final Color textColor;
  final Color tabColor;
  const TabData({this.index, this.title, this.widget, this.icon, this.textColor, this.tabColor});
}
