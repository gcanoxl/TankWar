import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:tankwar/tank_game.dart';

class Bullet extends SpriteComponent with HasGameRef<TankGame> {
  static const double maxSpeed = 800;

  Bullet({required this.velocity}) : super(anchor: Anchor.center) {
    angle += angleTo(velocity + position);
  }
  final Vector2 velocity;
  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(game.images.fromCache('bullet_green_1.png'));
    size = sprite!.image.size;
    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (velocity != Vector2.zero()) {
      position += velocity * maxSpeed * dt;
    }
    super.update(dt);
  }
}
