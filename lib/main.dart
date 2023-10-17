import 'dart:io';

import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tankwar/joystick_tank_game.dart';
import 'package:tankwar/keyboard_tank_game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  bool isMobile;
  if (!kIsWeb) {
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      isMobile = false;
    } else {
      isMobile = true;
    }
  } else {
    // TODO: check for UA?
    isMobile = true;
  }
  if (isMobile) {
    runApp(GameWidget(game: KeyboardTankGame()));
  } else {
    runApp(GameWidget(game: JoystickTankGame()));
  }
}
