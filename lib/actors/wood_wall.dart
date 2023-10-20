import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:tankwar/actors/wall.dart';
import 'package:tankwar/tank_game.dart';

class WoodWall extends Wall {
  @override
  FutureOr<void> onLoad() async {
    sprite = await game.loadSprite('crate_wood.png');
    add(RectangleHitbox(isSolid: true));
    return super.onLoad();
  }
}
