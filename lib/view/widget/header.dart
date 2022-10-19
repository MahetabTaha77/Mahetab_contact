import 'package:flutter/material.dart';

headerWidget(
    {required Color backColor,
    required Widget leading,
    required String title,
    required Widget action}) {
  return AppBar(
    backgroundColor: backColor,
    leading: leading,
    title: Text(title),
    actions: [action],
    centerTitle: true,
  );
}
