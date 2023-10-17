import 'package:flame/components.dart';

abstract class BaseTank extends SpriteComponent {
  BaseTank() : super(size: Vector2(42, 46));
  Vector2 velocity = Vector2.zero();

  static const double maxTankSpeed = 200;

  @override
  void update(double dt) {
    position += velocity * maxTankSpeed * dt;
    super.update(dt);
  }
}
