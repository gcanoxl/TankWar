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
}
