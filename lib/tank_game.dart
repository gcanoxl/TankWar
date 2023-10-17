import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:tankwar/actors/player_tank.dart';

abstract class TankGame extends FlameGame {
  @override
  bool get debugMode => true;

  final PlayerTank playerTank = PlayerTank();

  @override
  @mustCallSuper
  FutureOr<void> onLoad() async {
    await images.loadAll([
      'tank_green.png',
      'bullet_green_1.png',
      'temp_map.webp',
    ]);

    playerTank.position = size / 2;
    world.add(playerTank);
    final map = Sprite(images.fromCache('temp_map.webp'));
    world.add(
      SpriteComponent(
        sprite: map,
        priority: -1,
        size: map.image.size,
      ),
    );
    camera.follow(playerTank);
    camera.setBounds(Rectangle.fromPoints(size / 2, map.image.size - size / 2));
  }
}
