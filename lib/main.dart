import 'package:bmi_cal/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'BMICalculatorScreen.dart';
import 'theme.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(ThemeData.dark()),
      child: new MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI',
      home: BMICalculatorScreen(),
      theme: theme.getTheme(),
    );
  }
}
