import 'dart:io';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tankwar/joystick_tank_game.dart';
import 'package:tankwar/keyboard_tank_game.dart';

void launchMobile() {
  Flame.device.fullScreen();
  Flame.device.setLandscape();
  runApp(GameWidget(game: JoystickTankGame()));
}

void launchPC() {
  runApp(GameWidget(game: KeyboardTankGame()));
}

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
    launchMobile();
  } else {
    launchPC();
  }
}
