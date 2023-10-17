import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:tankwar/actors/base_tank.dart';
import 'package:tankwar/tank_game.dart';

class PlayerTank extends BaseTank with HasGameRef<TankGame> {
  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(game.images.fromCache('tank_green.png'));
    angle = pi;
    anchor = Anchor.center;
    position = game.size / 2;
  }
}
