import 'package:flutter/material.dart';
import 'package:girlscode_example/widgets/splash.dart';
import 'package:girlscode_example/widgets/theme.dart';

import 'widgets/skills.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      // home: CounterPage(title: 'Flutter Demo Home Page'),
      home: SplashScreen(),
    );
  }
}
