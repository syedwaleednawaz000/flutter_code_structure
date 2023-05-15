import 'package:flutter/material.dart';
import 'package:simple_flutter_project/View/Home/homeview.dart';
import 'package:simple_flutter_project/View/HomeNew/home_data_get_from_api_consumer.dart';
import 'package:simple_flutter_project/View/HomeNew/home_data_get_from_api_selector.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => HomeScreen()),
              ),
              child:const  Text('Counter'),
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
          ],
        ),
      ),
    );
  }
}