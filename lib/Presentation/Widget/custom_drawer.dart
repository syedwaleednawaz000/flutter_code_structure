import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code_structure/Language/app_translation.dart';
import 'package:flutter_code_structure/Presentation/Screens/Dashboard/components/list_tile_widget.dart';



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
             Material(
              elevation: 0,

              /// DrawerHeader()
              child: UserAccountsDrawerHeader(
                currentAccountPictureSize: const Size.square(70),
                currentAccountPicture: const CircleAvatar(
                  child: FlutterLogo(),
                ),
                accountName: Text(AppTranslations.of(context).abid_ullah_orakzai),
                accountEmail: const Text('abid.kust2019@gmail.com'),
                decoration: const BoxDecoration(
                  // borderRadius: BorderRadius.only(
                  //   bottomRight: Radius.circular(20),
                  //   topRight: Radius.circular(20),
                  // ),
                  color: Colors.blue,
                ),
              ),
            ),
            ListTileWidget(
              text: AppTranslations.of(context).my_profile,
              onPressed: () {
                Navigator.pop(context);
              },
              leadingIcon: Icons.person,
            ),
            ListTileWidget(
              text: AppTranslations.of(context)!.my_course,
              onPressed: () {
                Navigator.pop(context);
              },
              leadingIcon: Icons.book,
            ),
            ListTileWidget(
              text: AppTranslations.of(context)!.my_premium,
              onPressed: () {
                Navigator.pop(context);
              },
              leadingIcon: Icons.workspace_premium,
            ),
            ListTileWidget(
              text: AppTranslations.of(context)!.saved_videos,
              onPressed: () {
                Navigator.pop(context);
              },
              leadingIcon: Icons.video_label,
            ),
            ListTileWidget(
              text: AppTranslations.of(context)!.edit_profile,
              onPressed: () {
                Navigator.pop(context);
              },
              leadingIcon: Icons.edit,
            ),
            ListTileWidget(
              text: AppTranslations.of(context)!.logout,
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
