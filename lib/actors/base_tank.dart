import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:tankwar/actors/bullet.dart';
import 'package:tankwar/actors/wall.dart';
import 'package:tankwar/tank_game.dart';

abstract class BaseTank extends SpriteComponent
    with HasGameRef<TankGame>, CollisionCallbacks {
  BaseTank() : super(nativeAngle: pi, anchor: Anchor.center);
  Vector2 velocity = Vector2.zero();

  final type = 'green';

  static const double maxTankSpeed = 200;

  @override
  FutureOr<void> onLoad() {
    game.world.children.register<BaseTank>();
    sprite = Sprite(game.images.fromCache('tank_$type.png'));
    if (sprite != null) {
      size = sprite!.image.size.scaled(0.6);
    }
    add(CircleHitbox(isSolid: true));
    return super.onLoad();
  }

  @override
  void update(double dt) {
    position += velocity * maxTankSpeed * dt;
    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is TiledComponent) {
      final mid = (intersectionPoints.first + intersectionPoints.last) / 2;
      final normal = absoluteCenter - mid;
      final u = normal * velocity.dot(normal) / normal.length2;

      // if (velocity != Vector2.zero()) {
      //   print(
      //       'velocity: $velocity, normal: $normal, u: $u, end: ${(velocity - u)}');
      // }
      if ((velocity.y > 0 && normal.y < 0) ||
          (velocity.y < 0 && normal.y > 0) ||
          (velocity.x > 0 && normal.x < 0) ||
          (velocity.x < 0 && normal.x > 0)) {
        velocity -= u;
      }
    }
    super.onCollision(intersectionPoints, other);
  }

  void fire() {
    final dir = Vector2(0, -1)..rotate(angle + nativeAngle);
    game.world.add(Bullet(
      velocity: dir,
      owner: this,
    )..position = position);
  }
}
