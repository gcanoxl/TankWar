import 'dart:math';

import 'package:flame/components.dart';
import 'package:tankwar/actors/base_tank.dart';

class EnemyTank extends BaseTank {
  final _rnd = Random();
  late Timer countdown;

  @override
  String get type => 'sand';
  static int fireInterval = 5;

  @override
  void onMount() {
    countdown = Timer(_rnd.nextDouble() * fireInterval);
    super.onMount();
  }

  @override
  void update(double dt) {
    // fire();
    countdown.update(dt);
    if (countdown.finished) {
      fire();
      countdown = Timer(_rnd.nextDouble() * fireInterval);
    }
    super.update(dt);
  }
}
