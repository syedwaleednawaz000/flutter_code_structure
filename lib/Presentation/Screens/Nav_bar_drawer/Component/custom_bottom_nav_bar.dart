import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:simple_flutter_project/my_size/my_size.dart';

class CustomBottomNavBar extends StatefulWidget {
  int currentIndex;
  final Function(int) onTap;

  CustomBottomNavBar({super.key, required this.currentIndex, required this.onTap});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      unselectedItemColor: Colors.grey,
      unselectedLabelStyle:  TextStyle(
        fontSize: MySize.size14,
        color: Colors.black
      ),
      backgroundColor: Colors.white,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedFontSize: MySize.size18,
      selectedItemColor: Colors.blue,
      items:  [
        BottomNavigationBarItem(
          icon: const Icon(Icons.countertops),
          label: AppLocalizations.of(context)!.counterText,
        ),

        BottomNavigationBarItem(
          icon: const Icon(Icons.construction),
          label: AppLocalizations.of(context)!.consumerText,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.select_all),
          label:  AppLocalizations.of(context)!.selectorText,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label:  AppLocalizations.of(context)!.profile,
        ),
      ],
    );
  }
}
