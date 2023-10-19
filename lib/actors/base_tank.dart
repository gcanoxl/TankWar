import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:tankwar/actors/bullet.dart';
import 'package:tankwar/tank_game.dart';

abstract class BaseTank extends SpriteComponent
    with HasGameRef<TankGame>, CollisionCallbacks {
  BaseTank() : super(nativeAngle: pi, anchor: Anchor.center);
  Vector2 velocity = Vector2.zero();
  Vector2 bulletVelocity = Vector2(0, 1).normalized();

  final type = 'green';

  static const double maxTankSpeed = 200;

  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(game.images.fromCache('tank_$type.png'));
    if (sprite != null) {
      size = sprite!.image.size.scaled(0.6);
    }
    add(CircleHitbox());
    return super.onLoad();
  }

  @override
  void update(double dt) {
    final v = velocity * maxTankSpeed * dt;
    final newPosiiotn = position + v;
    if (newPosiiotn.x - size.x / 2 < 0 ||
        newPosiiotn.x + size.x / 2 > game.map!.image.size.x) {
      velocity.x = 0;
    }
    if (newPosiiotn.y - size.y / 2 < 0 ||
        newPosiiotn.y + size.y / 2 > game.map!.image.size.y) {
      velocity.y = 0;
    }

    velocity.normalize();

    position += velocity * maxTankSpeed * dt;
    if (velocity != Vector2.zero()) {
      angle += angleTo(velocity + position);
      bulletVelocity = velocity;
    }
    super.update(dt);
  }

  void fire() {
    game.world.add(Bullet(
      velocity: bulletVelocity,
      owner: this,
    )..position = position);
  }
}
