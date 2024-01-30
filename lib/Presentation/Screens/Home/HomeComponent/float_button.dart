import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_flutter_project/config/app_color.dart';
import 'package:simple_flutter_project/my_size/my_size.dart';


class FloatButton extends StatelessWidget {
  void Function()? increment, decrement;
   FloatButton({required this.decrement, required this.increment,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: decrement,
          child: Container(
            height: MySize.size50,
            width: MySize.size50,
            decoration:  BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.green
            ),
            child: Icon(Icons.remove,color: AppColor.white,),
          ),
        ),
        GestureDetector(
          onTap: increment,
          child: Container(
            height: MySize.size50,
            width: MySize.size50,
            decoration:  BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.green
            ),
            child: Icon(Icons.add,color: AppColor.white,),
          ),
        ),
      ],
    );;
  }
}
