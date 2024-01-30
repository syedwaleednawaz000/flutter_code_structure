import 'package:flutter/material.dart';
import 'package:simple_flutter_project/my_size/my_size.dart';
///
/// this class with provide an overall project text style
///
///
///
class AppStyle {
  static  TextStyle heading1 = TextStyle(
    fontSize: MySize.size32,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static BoxDecoration getContainerRadios15(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(MySize.size15),
    );
  }
}
