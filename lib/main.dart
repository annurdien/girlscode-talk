import 'package:flutter/material.dart';
import 'package:girlscode_example/widgets/counter.dart';
import 'package:girlscode_example/widgets/splash.dart';
import 'package:girlscode_example/widgets/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Apps',
      theme: appTheme,
      // home: CounterPage(
      //   title: "Example APP",
      // ),
      home: SplashScreen(),
    );
  }
}
