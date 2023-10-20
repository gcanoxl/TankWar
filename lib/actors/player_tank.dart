import 'package:flame/components.dart';
import 'package:tankwar/actors/base_tank.dart';

class PlayerTank extends BaseTank {
  JoystickComponent? joystick;

  @override
  void update(double dt) {
    super.update(dt);
    if (joystick == null) {
      return;
    }
    velocity = joystick!.relativeDelta.normalized();
    if (joystick!.direction != JoystickDirection.idle) {
      angle += angleTo(velocity + position);
    }
  }
}
