import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:tankwar/tank_game.dart';

class SplashRoute extends Component with HasGameRef<TankGame>, TapCallbacks {
  @override
  FutureOr<void> onLoad() async {
    add(RectangleComponent(
      size: game.size,
      paint: Paint()..color = Colors.green,
    ));
    add(TextComponent(
      text: "坦克大战",
      position: game.size / 2,
      anchor: Anchor.center,
      scale: Vector2.all(3),
    ));
    return super.onLoad();
  }

  loadAssets() async {
    await game.images.loadAll([
      'tank_green.png',
      'bullet_green_1.png',
      'temp_map.webp',
    ]);
    // await Future.delayed(const Duration(seconds: 2));
  }

  @override
  void onMount() async {
    await loadAssets();
    add(
      TextComponent(
        text: "加载完成,点击屏幕任意位置进入游戏!",
        position: game.size / 2 + Vector2(0, 60),
        anchor: Anchor.center,
      ),
    );
    super.onMount();
  }

  @override
  bool containsLocalPoint(Vector2 point) => true;

  @override
  void onTapDown(TapDownEvent event) {
    game.router.pushReplacementNamed('home');
    super.onTapDown(event);
  }
}
