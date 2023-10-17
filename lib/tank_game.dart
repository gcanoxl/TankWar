import 'dart:async';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:tankwar/actors/player_tank.dart';

abstract class TankGame extends FlameGame {
  @override
  Color backgroundColor() => Colors.greenAccent;

  late final PlayerTank playerTank;

  @override
  FutureOr<void> onLoad() async {
    await images.loadAll([
      'tank_green.png',
    ]);

    add(playerTank);
  }
}
