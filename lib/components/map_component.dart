import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:tankwar/tank_game.dart';

class MapComponent extends SpriteComponent with HasGameRef<TankGame> {
  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(game.images.fromCache('temp_map.webp'));
    add(RectangleHitbox(
      size: size,
      collisionType: CollisionType.passive,
    ));
    return super.onLoad();
  }
}
