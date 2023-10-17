import 'dart:math';

import 'package:flame/components.dart';

abstract class BaseTank extends SpriteComponent {
  BaseTank()
      : super(
          size: Vector2(42, 46),
          nativeAngle: pi,
          anchor: Anchor.center,
        );
  Vector2 velocity = Vector2.zero();

  static const double maxTankSpeed = 200;

  @override
  void update(double dt) {
    position += velocity * maxTankSpeed * dt;
    angle += angleTo(velocity + position);
    super.update(dt);
  }

  void rotateToDirection(JoystickDirection dir) {
    Vector2 v = Vector2.zero();
    switch (dir) {
      case JoystickDirection.left:
        v = Vector2(-1, 0);
        break;
      case JoystickDirection.upLeft:
        v = Vector2(-1, -1);
        break;
      case JoystickDirection.up:
        v = Vector2(0, -1);
        break;
      case JoystickDirection.upRight:
        v = Vector2(1, -1);
        break;
      case JoystickDirection.right:
        v = Vector2(1, 0);
        break;
      case JoystickDirection.downRight:
        v = Vector2(1, 1);
        break;
      case JoystickDirection.down:
        v = Vector2(0, 1);
        break;
      case JoystickDirection.downLeft:
        v = Vector2(-1, 1);
        break;
      default:
    }
    velocity = v.normalized();
  }
}
