import 'dart:math';

import 'package:flame/components.dart';
import 'package:tankwar/actors/base_tank.dart';

class EnemyTank extends BaseTank {
  final _rnd = Random();
  late final Timer countdown;

  @override
  String get type => 'sand';

  @override
  void onMount() {
    countdown = Timer(
      _rnd.nextDouble(),
      repeat: true,
    );
    super.onMount();
  }

  @override
  void update(double dt) {
    fire();
    // countdown.update(dt);
    // if (countdown.finished) {
    //   fire();
    // }
    super.update(dt);
  }
}
