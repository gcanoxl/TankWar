import 'package:flame/components.dart';
import 'package:tankwar/actors/base_tank.dart';

class PlayerTank extends BaseTank {
  JoystickComponent? joystick;

  @override
  void update(double dt) {
    super.update(dt);
    if (joystick != null) {
      velocity = joystick!.relativeDelta.normalized();
      angle += angleTo(velocity + position);
    }
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
    angle += angleTo(velocity + position);
  }
}
