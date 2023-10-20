import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:tankwar/actors/bullet.dart';
import 'package:tankwar/components/map_component.dart';
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

  Vector2 oldPosition = Vector2.zero();
  @override
  void update(double dt) {
    final tanks = game.world.children.query<BaseTank>().toSet();
    if (activeCollisions.intersection(tanks).isEmpty &&
        !collidingWith(game.mapComponent!)) {
      oldPosition = Vector2(
        position.x.ceilToDouble(),
        position.y.ceilToDouble(),
      );
    }
    position += velocity * maxTankSpeed * dt;
    if (velocity != Vector2.zero()) {
      angle += angleTo(velocity + position);
    }
    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is MapComponent || other is BaseTank) {
      position = oldPosition.clone();
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
