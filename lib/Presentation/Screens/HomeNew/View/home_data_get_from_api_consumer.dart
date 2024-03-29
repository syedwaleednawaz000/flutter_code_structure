import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:simple_flutter_project/Presentation/Screens/HomeNew/Provider/user_provider.dart';
import 'package:simple_flutter_project/Presentation/Screens/Main/components/custom_app_bar.dart';

import 'package:simple_flutter_project/Presentation/Screens/Main/components/custom_drawer.dart';
import 'package:simple_flutter_project/config/app_router_constants.dart';

class HomeAPIConsumer extends StatelessWidget {
  String? screenName;
   HomeAPIConsumer({required this.screenName,super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // final Color color = AppConstant(context).getColor;
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      drawer: const CustomDrawer(),
      key: _scaffoldKey,
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
      body: FutureBuilder(
        future: Provider.of<UserProvider>(context, listen: false).fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return Consumer<UserProvider>(
                builder: (context, userProvider, child) {
              return ListView.builder(
                itemCount: userProvider.users.length,
                itemBuilder: (context, index) {
                  final user = userProvider.users[index];
                  return ListTile(
                    title: Text(
                      user.name,
                      style: TextStyle(color:  Theme.of(context).primaryColor),
                    ),
                    subtitle: Text(
                      user.email,
                      style: TextStyle(color:  Theme.of(context).primaryColor),
                    ),
                  );
                },
              );
            });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<UserProvider>(context, listen: false).fetchUsers();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
