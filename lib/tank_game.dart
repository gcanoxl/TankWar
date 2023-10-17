import 'dart:async';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:tankwar/actors/player_tank.dart';

abstract class TankGame extends FlameGame {
  @override
  Color backgroundColor() => Colors.greenAccent;

  @override
  bool get debugMode => false;

  final PlayerTank playerTank = PlayerTank();

  @override
  @mustCallSuper
  FutureOr<void> onLoad() async {
    await images.loadAll([
      'tank_green.png',
      'bullet_green_1.png',
    ]);

    playerTank.position = Vector2(100, 100);
    add(playerTank);
  }
}
