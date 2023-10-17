import 'dart:async';

import 'package:flame/components.dart';
import 'package:tankwar/actors/base_tank.dart';
import 'package:tankwar/tank_game.dart';

class PlayerTank extends BaseTank with HasGameRef<TankGame> {
  PlayerTank({required this.joystick});
  JoystickComponent joystick;

  @override
  void update(double dt) {
    super.update(dt);
    if (!joystick.delta.isZero()) {
      velocity = joystick.relativeDelta.normalized();
    }
  }

  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(game.images.fromCache('tank_green.png'));
    position = game.size / 2;
  }

  void rotateToDirection(JoystickDirection dir) {
    if (!joystick.delta.isZero()) return;
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
