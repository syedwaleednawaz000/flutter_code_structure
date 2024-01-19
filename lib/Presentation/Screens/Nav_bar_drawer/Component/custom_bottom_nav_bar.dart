import 'package:flutter/material.dart';
import 'package:simple_flutter_project/Presentation/Screens/Main/View/selectview.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:simple_flutter_project/l10n/support_languages.dart';
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
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      unselectedItemColor: Colors.grey,
      unselectedLabelStyle: const TextStyle(
        fontSize: 14,
        color: Colors.black
      ),
      backgroundColor: Colors.white,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedFontSize: 18,
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
          icon: Icon(Icons.select_all),
          label:  AppLocalizations.of(context)!.selectorText,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label:  AppLocalizations.of(context)!.profile,
        ),
      ],
    );
  }
}
