import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_flutter_project/Presentation/Screens/Home/Provider/counter_provider.dart';
import 'package:simple_flutter_project/Presentation/Widget/my_button.dart';
import 'package:simple_flutter_project/config/app_constant.dart';
import 'package:simple_flutter_project/config/app_images.dart';
import '../HomeComponent/float_button.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Color color = AppConstant(context).getColor;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Consumer<CounterProvider>(
            builder: (context, counterProvider, child) {
          return FloatButton(decrement: () {
            counterProvider.decrement();
          }, increment: () {
            counterProvider.increment();
          });
        }),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(AppImages.logo),
                )),
              ),
              Consumer<CounterProvider>(
                  builder: (context, counterProvider, child) {
                return Text(
                  "Counter Value ${counterProvider.counterValue.toString()}",
                  style: TextStyle(color:  Theme.of(context).primaryColor),
                );
              }),
              MyButton(
                title: "login",
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
