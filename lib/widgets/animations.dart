import 'dart:math' show Random;

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

enum AppAnimationType { planet, hand, painting, zombie }

class AppAnimation extends StatelessWidget {
  const AppAnimation({Key? key, required this.type, this.fit})
      : super(key: key);
  final AppAnimationType type;
  final BoxFit? fit;

  String _animationAssetPath(AppAnimationType type) {
    switch (type) {
      case AppAnimationType.hand:
        return 'assets/hand.riv';
      case AppAnimationType.painting:
        return 'assets/painting.riv';
      case AppAnimationType.planet:
        return 'assets/blue-planet.riv';
      case AppAnimationType.zombie:
        return 'assets/zombie.riv';
      default:
        return 'assets/zombie.riv';
    }
  }

  String _animationName(AppAnimationType type) {
    switch (type) {
      case AppAnimationType.hand:
        return 'Loading';
      case AppAnimationType.painting:
        return 'Animation 1';
      case AppAnimationType.planet:
        return 'rotation';
      case AppAnimationType.zombie:
        return 'Walk';
      default:
        return 'idle';
    }
  }

  @override
  Widget build(BuildContext context) {
    return RiveAnimation.asset(
      _animationAssetPath(type),
      alignment: Alignment.center,
      fit: fit ?? BoxFit.fitWidth,
      animations: [_animationName(type)],
    );
  }

  AppAnimationType randomAppAnimationType() {
    final random = Random();

    switch (random.nextInt(3)) {
      case 0:
        return AppAnimationType.hand;
      case 1:
        return AppAnimationType.painting;
      case 2:
        return AppAnimationType.planet;
      default:
        return AppAnimationType.zombie;
    }
  }
}
