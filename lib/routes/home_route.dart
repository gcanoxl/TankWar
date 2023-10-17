import 'package:flame/components.dart';
import 'package:flutter/widgets.dart';
import 'package:tankwar/routes/components/color_background.dart';
import 'package:tankwar/routes/components/rounded_button.dart';
import 'package:tankwar/routes/components/text_logo_component.dart';
import 'package:tankwar/tank_game.dart';

class HomeRoute extends Component with HasGameRef<TankGame> {
  final TextLogoComponent _logo = TextLogoComponent();
  late final RoundedButton _singleplayer;
  late final RoundedButton _multiplayer;
  late final RoundedButton _settings;
  late final RoundedButton _tutorial;
  late final RoundedButton _quit;
  HomeRoute() {
    const Color btColor = Color(0xffadde6c);
    const Color bdColor = Color(0xffedffab);
    addAll([
      ColorBackground(),
      _logo,
      _singleplayer = RoundedButton(
        text: '单人游戏',
        action: () {},
        color: btColor,
        borderColor: bdColor,
      ),
      _multiplayer = RoundedButton(
        text: "多人游戏",
        action: () {},
        color: btColor,
        borderColor: bdColor,
      ),
      _settings = RoundedButton(
        text: "设置",
        action: () {},
        color: btColor,
        borderColor: bdColor,
      ),
      _tutorial = RoundedButton(
        text: "游戏说明",
        action: () {},
        color: btColor,
        borderColor: bdColor,
      ),
      _quit = RoundedButton(
        text: "退出游戏",
        action: () {},
        color: btColor,
        borderColor: bdColor,
      ),
    ]);
  }

  @override
  void onGameResize(Vector2 size) {
    final spaceHeight = size.y / 8;
    _logo.position = Vector2(size.x / 2, size.y / 6);
    _singleplayer.position =
        Vector2(size.x / 2, _logo.position.y + spaceHeight * 1.6);
    _multiplayer.position =
        Vector2(size.x / 2, _singleplayer.position.y + spaceHeight);
    _settings.position =
        Vector2(size.x / 2, _multiplayer.position.y + spaceHeight);
    _tutorial.position =
        Vector2(size.x / 2, _settings.position.y + spaceHeight);
    _quit.position = Vector2(size.x / 2, _tutorial.position.y + spaceHeight);
    super.onGameResize(size);
  }
}
