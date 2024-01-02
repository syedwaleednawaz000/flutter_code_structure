import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_flutter_project/Presentation/Screens/Main/components/list_tile_widget.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const Material(
              elevation: 0,

              /// DrawerHeader()
              child: UserAccountsDrawerHeader(
                currentAccountPictureSize: Size.square(70),
                currentAccountPicture: CircleAvatar(
                  child: FlutterLogo(),
                ),
                accountName: Text('Abid Ullah Orakzai'),
                accountEmail: Text('abid.kust2019@gmail.com'),
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.only(
                  //   bottomRight: Radius.circular(20),
                  //   topRight: Radius.circular(20),
                  // ),
                  color: Colors.blue,
                ),
              ),
            ),
            ListTileWidget(
              text: 'My Profile',
              onPressed: () {
                Navigator.pop(context);
              },
              leadingIcon: Icons.person,
            ),
            ListTileWidget(
              text: 'My Course',
              onPressed: () {
                Navigator.pop(context);
              },
              leadingIcon: Icons.book,
            ),
            ListTileWidget(
              text: 'Go Premium',
              onPressed: () {
                Navigator.pop(context);
              },
              leadingIcon: Icons.workspace_premium,
            ),
            ListTileWidget(
              text: 'Saved Videos',
              onPressed: () {
                Navigator.pop(context);
              },
              leadingIcon: Icons.video_label,
            ),
            ListTileWidget(
              text: 'Edit Profile',
              onPressed: () {
                Navigator.pop(context);
              },
              leadingIcon: Icons.edit,
            ),
            ListTileWidget(
              text: 'LogOut',
              onPressed: () {
                Navigator.pop(context);
              },
              leadingIcon: Icons.logout,
            ),
          ],
        ),
      ),
    );
  }
}
