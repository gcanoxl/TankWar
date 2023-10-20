import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:tankwar/tank_game.dart';

class Wall extends SpriteComponent with HasGameRef<TankGame> {
  @override
  FutureOr<void> onLoad() {
    add(RectangleHitbox(isSolid: true));
    return super.onLoad();
  }
}
