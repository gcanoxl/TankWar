import 'dart:async';

import 'package:flame/components.dart';
import 'package:tankwar/actors/base_tank.dart';

class EnemyTank extends BaseTank {
  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(game.images.fromCache('tank_sand.png'));
    return super.onLoad();
  }
}
