import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:tankwar/tank_game.dart';

class JoystickTankGame extends TankGame {
  late final JoystickComponent joystick;

  void addJoystick({double radius = 80, double knobRadius = 30}) {
    final knobPaint = BasicPalette.white.withAlpha(200).paint();
    final backgroundPaint = BasicPalette.white.withAlpha(100).paint();
    joystick = JoystickComponent(
      knobRadius: radius - knobRadius,
      knob: CircleComponent(radius: knobRadius, paint: knobPaint),
      background: CircleComponent(radius: radius, paint: backgroundPaint),
      margin: const EdgeInsets.only(left: 40, bottom: 40),
    );
    add(joystick);
    playerTank.joystick = joystick;
  }

  @override
  FutureOr<void> onLoad() {
    addJoystick();

    final paint = BasicPalette.white.withAlpha(150).paint();
    final pressedPaint = BasicPalette.white.withAlpha(80).paint();
    add(
      ButtonComponent(
          button: CircleComponent(radius: 60, paint: paint),
          buttonDown: CircleComponent(radius: 60, paint: pressedPaint),
          onPressed: () {
            playerTank.fire();
          })
        ..position = size - Vector2.all(150),
    );

    super.onLoad();
  }
}