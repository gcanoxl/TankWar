import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tankwar/actors/player_tank.dart';

class TankGame extends FlameGame with KeyboardEvents {
  @override
  Color backgroundColor() => Colors.greenAccent;

  late final PlayerTank _playerTank;

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
  }

  @override
  FutureOr<void> onLoad() async {
    await images.loadAll([
      'tank_green.png',
    ]);
    addJoystick();

    add(_playerTank = PlayerTank(joystick: joystick));
  }

  JoystickDirection calcDirection(bool left, up, right, down) {
    if (left && !up && !right && !down) {
      return JoystickDirection.left;
    } else if (left && up && !right && !down) {
      return JoystickDirection.upLeft;
    } else if (!left && up && !right && !down) {
      return JoystickDirection.up;
    } else if (!left && up && right && !down) {
      return JoystickDirection.upRight;
    } else if (!left && !up && right && !down) {
      return JoystickDirection.right;
    } else if (!left && !up && right && down) {
      return JoystickDirection.downRight;
    } else if (!left && !up && !right && down) {
      return JoystickDirection.down;
    } else if (left && !up && !right && down) {
      return JoystickDirection.downLeft;
    } else {
      return JoystickDirection.idle;
    }
  }

  @override
  KeyEventResult onKeyEvent(
      RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    final dir = calcDirection(
      keysPressed.contains(LogicalKeyboardKey.keyA),
      keysPressed.contains(LogicalKeyboardKey.keyW),
      keysPressed.contains(LogicalKeyboardKey.keyD),
      keysPressed.contains(LogicalKeyboardKey.keyS),
    );
    _playerTank.rotateToDirection(dir);
    return super.onKeyEvent(event, keysPressed);
  }
}
