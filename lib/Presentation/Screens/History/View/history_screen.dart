import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_code_structure/Presentation/Screens/Dashboard/components/custom_app_bar.dart';
import 'package:flutter_code_structure/Presentation/Screens/Dashboard/components/custom_drawer.dart';
import 'package:flutter_code_structure/Presentation/Screens/History/Provider/history_provider.dart';
import 'package:flutter_code_structure/config/app_router_constants.dart';

class HistoryScreen extends StatelessWidget {
  String? screenName;
   HistoryScreen({required this.screenName,super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      key: _scaffoldKey,
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
      drawer: const CustomDrawer(),
      body: Consumer<HistoryProvider>(builder: (context, historyProvider, child) {
        return ListView.builder(
          itemCount: historyProvider.categoryList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("${historyProvider.categoryList[index]} history"),
              onTap: () {

              },
            );
          },
        );
      },),
    );
  }
}
