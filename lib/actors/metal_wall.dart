import 'dart:async';

import 'package:tankwar/actors/wall.dart';

class MetalWall extends Wall {
  @override
  FutureOr<void> onLoad() async {
    sprite = await game.loadSprite('crate_metal.png');
    return super.onLoad();
  }
}
