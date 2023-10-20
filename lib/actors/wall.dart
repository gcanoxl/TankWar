import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:tankwar/tank_game.dart';

class Wall extends SpriteComponent with HasGameRef<TankGame> {
  @override
  FutureOr<void> onLoad() async {
    // sprite = Sprite(game.images.fromCache('crate_metal.png'));
    sprite = await game.loadSprite('crate_metal.png');
    add(RectangleHitbox(isSolid: true));
    return super.onLoad();
  }
}
