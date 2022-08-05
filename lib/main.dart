import 'package:flutter/material.dart';
import 'package:statistics_project/view/statistics.dart';

import 'Theme/light_theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: LighTheme().theme,
      home: const StatisticsAnalysis(),
    );
  }
}

