import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/extensions.dart';
import 'package:tankwar/tank_game.dart';

class SingleplaeryRoute extends Component {
  @override
  FutureOr<void> onLoad() {
    TankGame game = findGame() as TankGame;
    if (game.joystickMode) {
      game.addJoystick();
    }

    game.playerTank.position = game.size / 2;
    game.world.add(game.playerTank);
    final map = Sprite(game.images.fromCache('temp_map.webp'));
    game.world.add(
      SpriteComponent(
        sprite: map,
        priority: -9991,
        size: map.image.size,
      ),
    );
    game.camera.follow(game.playerTank);
    game.camera.setBounds(
      Rectangle.fromLTWH(
        game.size.x / 2,
        game.size.y / 2,
        map.image.size.x - game.size.x / 2,
        map.image.size.y - game.size.y / 2,
      ),
    );
    return super.onLoad();
  }
}
