import 'package:flutter/material.dart';
import 'package:simple_flutter_project/config/app_color.dart';


class MyButton extends StatelessWidget {
  void Function()? onTap;
  String? title;
   MyButton({required this.title, required this.onTap,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Text(title.toString(),style: const TextStyle(color: Colors.white),)),
      ),
    );
  }
}
