import 'dart:async';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:tankwar/actors/player_tank.dart';

class TankGame extends FlameGame {
  @override
  Color backgroundColor() => Colors.greenAccent;

  @override
  FutureOr<void> onLoad() async {
    await images.loadAll([
      'tank_green.png',
    ]);
    add(PlayerTank());
  }
}
