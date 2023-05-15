import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_flutter_project/Provider/counterprovider.dart';
import 'package:simple_flutter_project/Utils/appimages.dart';
import 'package:simple_flutter_project/Widget/mybutton.dart';

import 'HomeComponent/floatbutton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Consumer<CounterProvider>(builder: (context, counterProvider, child){
          return FloatButton(decrement: (){counterProvider.decrement();},
            increment: (){
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
                  )
                ),
              ),
              Consumer<CounterProvider>(builder: (context,counterProvider, child){
                return Text("Counter Value ${counterProvider.counterValue.toString()}");
              }),
              MyButton(title: "login", onTap: (){})
            ],
          ),
        ),
      ),
    );
  }
}
