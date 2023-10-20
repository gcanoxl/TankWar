import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:tankwar/actors/wall.dart';

class MetalWall extends Wall {
  @override
  FutureOr<void> onLoad() async {
    // sprite = Sprite(game.images.fromCache('crate_metal.png'));
    sprite = await game.loadSprite('crate_metal.png');
    add(RectangleHitbox(isSolid: true));
    return super.onLoad();
  }
}
