import 'dart:async';

import 'package:flame/components.dart';
import 'package:tankwar/tank_game.dart';

class SingleplaeryRoute extends Component {
  @override
  FutureOr<void> onLoad() {
    TankGame game = findGame() as TankGame;
    game.gameInit();
    return super.onLoad();
  }
}
