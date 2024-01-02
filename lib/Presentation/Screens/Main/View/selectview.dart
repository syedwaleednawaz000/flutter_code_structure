import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_flutter_project/Presentation/Screens/Home/View/homeview.dart';
import 'package:simple_flutter_project/Presentation/Screens/HomeNew/View/home_data_get_from_api_consumer.dart';
import 'package:simple_flutter_project/Presentation/Screens/Main/components/language_drop_down.dart';
import 'package:simple_flutter_project/config/app_constant.dart';
import 'package:simple_flutter_project/config/app_router_constants.dart';
import 'package:simple_flutter_project/Utils/utils.dart';
import '../../HomeNew/View/home_data_get_from_api_selector.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    final Color color = AppConstant(context).getColor;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// this is abid drop down for language localization
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Select Language',
                  style: TextStyle(color: color),
                ),
                const LanguageDropDown(),
              ],
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => HomeScreen()),
              ),
              child: const Text('Counter'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HomeAPIConsumer()),
              ),
              child: const Text('Consumer'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HomeAPISelector()),
              ),
              child: const Text('Selector'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                context
                    .pushNamed(AppRouterConstants.navigationDrawerMainScreen);
              },
              child: Text(
                'Go to New Code',
                style: TextStyle(color: color),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
