import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:tankwar/actors/base_tank.dart';
import 'package:tankwar/actors/explosion.dart';
import 'package:tankwar/tank_game.dart';

class Bullet extends SpriteComponent
    with HasGameRef<TankGame>, CollisionCallbacks {
  static const double maxSpeed = 800;

  Bullet({
    required this.owner,
    required this.velocity,
  }) : super(anchor: Anchor.center) {
    angle += angleTo(velocity + position);
  }
  final Vector2 velocity;
  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(game.images.fromCache('bullet_green_1.png'));
    size = sprite!.image.size.scaled(0.6);
    add(CircleHitbox());
    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (velocity != Vector2.zero()) {
      position += velocity * maxSpeed * dt;
    }
    if (game.map != null) {
      final leftTopCorner = absolutePositionOfAnchor(Anchor.topLeft);
      final rightDownCorner = absolutePositionOfAnchor(Anchor.bottomRight);
      if (leftTopCorner.x > game.map!.image.size.x ||
          leftTopCorner.y > game.map!.image.size.y ||
          rightDownCorner.x < 0 ||
          rightDownCorner.y < 0) {
        removeFromParent();
      }
    }
    super.update(dt);
  }

  final BaseTank owner;

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is BaseTank && other != owner) {
      game.world.add(Explosion(position: (other.position + position) / 2));
      other.removeFromParent();
      removeFromParent();
    }
    super.onCollision(intersectionPoints, other);
  }
}
