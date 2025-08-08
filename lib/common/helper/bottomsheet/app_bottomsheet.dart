import 'package:flutter/material.dart';

class AppBottomsheet {
  static Future<void> display(BuildContext context, Widget widget) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      context: context,
      builder: (_) {
        return widget;
      },
    );
  }
}
