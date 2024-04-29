import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_code_structure/Presentation/Screens/Home/Provider/home_provider.dart';
import 'package:flutter_code_structure/Presentation/Widget/custom_app_bar.dart';
import 'package:flutter_code_structure/Presentation/Widget/custom_drawer.dart';
import 'package:flutter_code_structure/config/app_router_constants.dart';

class HomeScreen extends StatelessWidget {
  String? screenName;
   HomeScreen({required this.screenName,Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).cardColor,
        drawer: const CustomDrawer(),
        appBar: customAppBar(
          onTapBack: (){
            context.go(AppRouteConstants.dashBoardScreen);
          },
          appBarText: screenName!,
          leadingIcon: Icons.menu,
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        body:  Expanded(
          child: Consumer<HomeProvider>(builder: (context, homeProvider, child) {
            return GridView.builder(
              gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: homeProvider.categoryList.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                  },
                  child: Card(
                    child: Center(
                      child: Text(
                        homeProvider.categoryList[index],
                        maxLines: null,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                );
              },
            );
          },),
        ),
      ),
    );
  }
}
