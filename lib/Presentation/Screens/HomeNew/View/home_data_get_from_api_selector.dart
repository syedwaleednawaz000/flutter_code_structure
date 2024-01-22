import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:simple_flutter_project/Presentation/Screens/HomeNew/Model/user_model.dart';
import 'package:simple_flutter_project/Presentation/Screens/HomeNew/Provider/user_provider.dart';
import 'package:simple_flutter_project/Presentation/Screens/Main/components/custom_app_bar.dart';
import 'package:simple_flutter_project/Presentation/Screens/Main/components/custom_drawer.dart';

import 'package:simple_flutter_project/config/app_constant.dart';

class HomeAPISelector extends StatelessWidget {
  String? screenName;
   HomeAPISelector({required this.screenName,super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // final Color color = AppConstant(context).getColor;
    return Scaffold(
      key: _scaffoldKey,
      /// this is abid custom app bar
      appBar: customAppBar(
        appBarText: screenName!,
        leadingIcon: Icons.menu,
        onPressed: () {
          _scaffoldKey.currentState!.openDrawer();
        },
      ),
      drawer: const CustomDrawer(),
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
            return Selector<UserProvider, List<User>>(
                selector: (context, userProvider) => userProvider.users,
                builder: (context, users, child) {
                  return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
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
