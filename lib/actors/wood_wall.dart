import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:tankwar/actors/wall.dart';

class WoodWall extends Wall {
  @override
  FutureOr<void> onLoad() async {
    sprite = await game.loadSprite('crate_wood.png');
    return super.onLoad();
  }
}
