import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:simple_flutter_project/Presentation/Screens/Home/Provider/counter_provider.dart';
import 'package:simple_flutter_project/Presentation/Screens/Main/components/custom_drawer.dart';
import 'package:simple_flutter_project/Presentation/Widget/my_button.dart';
import 'package:simple_flutter_project/config/app_router_constants.dart';
import '../../Main/components/custom_app_bar.dart';
import '../HomeComponent/float_button.dart';

class CounterScreen extends StatelessWidget {
  String? screenName;
   CounterScreen({required this.screenName,Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // final Color color = AppConstant(context).getColor;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).cardColor,
        drawer: const CustomDrawer(),
        key: _scaffoldKey,

        /// this is abid custom app bar
        appBar: customAppBar(
          onTapBack: (){
            context.go(AppRouteConstants.navigationDrawerMainScreen);
          },
          appBarText: screenName!,
          leadingIcon: Icons.menu,
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
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
              Consumer<CounterProvider>(
                  builder: (context, counterProvider, child) {
                return Text(
                  "Counter Value ${counterProvider.counterValue.toString()}",
                  style: TextStyle(color:  Theme.of(context).primaryColor),
                );
              }),
              MyButton(
                title: "login",
                onTap: () {
                  context.goNamed(AppRouteConstants.profileScreen);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
