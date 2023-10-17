import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:tankwar/actors/bullet.dart';
import 'package:tankwar/tank_game.dart';

abstract class BaseTank extends SpriteComponent with HasGameRef<TankGame> {
  BaseTank() : super(nativeAngle: pi, anchor: Anchor.center);
  Vector2 velocity = Vector2.zero();
  Vector2 bulletVelocity = Vector2(0, 1).normalized();

  static const double maxTankSpeed = 200;

  @override
  FutureOr<void> onLoad() {
    if (sprite != null) {
      size = sprite!.image.size;
    }
    return super.onLoad();
  }

  @override
  void update(double dt) {
    position += velocity * maxTankSpeed * dt;
    if (velocity != Vector2.zero()) {
      angle += angleTo(velocity + position);
      bulletVelocity = velocity;
    }
    super.update(dt);
  }

  void fire() {
    game.world.add(Bullet(velocity: bulletVelocity)..position = position);
  }
}
