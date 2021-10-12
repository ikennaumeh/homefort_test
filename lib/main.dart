import 'package:flutter/material.dart';
import 'package:homefort_test/views/ui/home/home_view.dart';

import 'core/services/locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'HomeFort',
      home: HomeView(),
    );
  }
}

