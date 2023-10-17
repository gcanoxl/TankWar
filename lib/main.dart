import 'dart:io';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tankwar/tank_game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  bool joystickMode;
  if (!kIsWeb) {
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      joystickMode = false;
    } else {
      Flame.device.setLandscape();
      // NOTE: fullscreen mode improvement
      Flame.device.fullScreen();
      joystickMode = true;
    }
  } else {
    // TODO: check for UA?
    joystickMode = true;
  }

  runApp(
    GameWidget(
      game: TankGame(
        joystickMode: joystickMode,
      ),
    ),
  );
}
