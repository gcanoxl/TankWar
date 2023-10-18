import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:tankwar/routes/components/color_background.dart';
import 'package:tankwar/routes/components/text_logo_component.dart';
import 'package:tankwar/tank_game.dart';

class SplashRoute extends Component with HasGameRef<TankGame>, TapCallbacks {
  // ACK: singleton pattern to improve performances
  final TextLogoComponent _logo = TextLogoComponent();
  TextComponent _loadingMessage = TextComponent();
  @override
  FutureOr<void> onLoad() async {
    addAll([
      ColorBackground(),
      _logo,
    ]);
    return super.onLoad();
  }

  loadAssets() async {
    await game.images.loadAll([
      'tank_green.png',
      'tank_sand.png',
      'bullet_green_1.png',
      'temp_map.webp',
      'explosion1.png',
      'explosion2.png',
      'explosion3.png',
      'explosion4.png',
      'explosion5.png',
    ]);
    // await Future.delayed(const Duration(seconds: 2));
  }

  @override
  void onMount() async {
    await loadAssets();
    add(
      _loadingMessage = TextComponent(
        text: "加载完成,点击屏幕任意位置进入游戏!",
        anchor: Anchor.center,
      ),
    );
    super.onMount();
  }

  @override
  bool containsLocalPoint(Vector2 point) => true;

  @override
  void onTapDown(TapDownEvent event) {
    game.router.pushReplacementNamed('home');
    super.onTapDown(event);
  }

  @override
  void onGameResize(Vector2 size) {
    _logo.position = size / 2;
    _loadingMessage.position = Vector2(
      size.x / 2,
      _logo.position.y + size.y / 6,
    );
    super.onGameResize(size);
  }
}
