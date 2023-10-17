import 'dart:async';

import 'package:flame/components.dart';
import 'package:tankwar/tank_game.dart';

class SplashRoute extends Component with HasGameRef<TankGame> {
  @override
  FutureOr<void> onLoad() async {
    await game.images.loadAll([
      'tank_green.png',
      'bullet_green_1.png',
      'temp_map.webp',
    ]);
    return super.onLoad();
  }
}
