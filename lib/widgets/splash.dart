import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:girlscode_example/widgets/animations.dart';
import 'package:girlscode_example/widgets/skills.dart';
import 'package:girlscode_example/widgets/theme.dart';

import 'counter.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: zombieBackground,
      body: Column(
        children: [
          //Animasi zombie
          //Menggunakan Rive
          Flexible(
            flex: 8,
            child: AppAnimation(
              type: AppAnimationType.zombie,
              fit: BoxFit.contain,
            ),
          ),

          // Teks Loading animated
          // Menggunakan library AnimatedTextKit
          Flexible(
            flex: 2,
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText(
                  'Girls Kode...',
                  textStyle: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.white),
                ),
              ],
              isRepeatingAnimation: true,
              repeatForever: true,
            ),
          ),
          SizedBox(
            height: 200,
          ),
          //Button di bawah loading animation
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text("Animation"),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => StateMachineSkills(),
                    ),
                  );
                },
              ),
              SizedBox(
                width: 50,
              ),
              ElevatedButton(
                child: Text("Counter"),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CounterPage(
                        title: "Counter Page",
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
