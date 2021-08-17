import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:girlscode_example/widgets/animations.dart';
import 'package:girlscode_example/widgets/theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: paintingBackground,
      body: Column(
        children: [
          Flexible(
            flex: 8,
            child: AppAnimation(
              type: AppAnimationType.zombie,
              fit: BoxFit.contain,
            ),
          ),
          Flexible(
            flex: 4,
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText(
                  'Loading...',
                  textStyle: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.white),
                ),
              ],
              isRepeatingAnimation: true,
              repeatForever: true,
            ),
          )
        ],
      ),
    );
  }
}
