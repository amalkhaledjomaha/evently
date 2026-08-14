import 'package:flutter/material.dart';

class TabInfo {
  TabInfo(
      {
        required this.iconPath,
        required this.content,
        required this.label,
      });
  final IconData iconPath;
  final Widget content;
  final String label;
}