import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:tankwar/actors/base_tank.dart';
import 'package:tankwar/actors/bullet.dart';
import 'package:tankwar/tank_game.dart';

class DebugInfoComponent extends HudMarginComponent with HasGameRef<TankGame> {
  DebugInfoComponent()
      : super(margin: const EdgeInsets.only(left: 20, top: 20));
  late final TextComponent tankCountComponent;
  late final TextComponent bulletCountComponent;
  static const _separatorHeight = 24;
  @override
  FutureOr<void> onLoad() {
    addAll([
      FpsTextComponent(),
      tankCountComponent = TextComponent(text: "Tank Count: 0"),
      bulletCountComponent = TextComponent(text: "Bullet Count: 0"),
    ]);

    return super.onLoad();
  }

  @override
  void onGameResize(Vector2 size) {
    double height = 0;
    for (final element in children) {
      (element as TextComponent).position = Vector2(0, height);
      height += _separatorHeight;
    }
    super.onGameResize(size);
  }

  @override
  void update(double dt) {
    final tankCount = game.world.children.query<BaseTank>().length;
    final bulletCount = game.world.children.query<Bullet>().length;
    tankCountComponent.text = "Tank Count: $tankCount";
    bulletCountComponent.text = "Bullet Count: $bulletCount";
    super.update(dt);
  }
}
