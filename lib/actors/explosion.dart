import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:tankwar/tank_game.dart';

class Explosion extends SpriteAnimationComponent with HasGameRef<TankGame> {
  Explosion({required super.position}) : super(anchor: Anchor.center);
  @override
  FutureOr<void> onLoad() {
    final sprites = [
      Sprite(game.images.fromCache('explosion1.png')),
      Sprite(game.images.fromCache('explosion2.png')),
      Sprite(game.images.fromCache('explosion3.png')),
      Sprite(game.images.fromCache('explosion4.png')),
      Sprite(game.images.fromCache('explosion5.png')),
    ];
    size = sprites[0].image.size.scaled(0.6);
    animation = SpriteAnimation.spriteList(
      sprites,
      stepTime: 0.12,
      loop: false,
    );

    animationTicker?.completed.whenComplete(() {
      removeFromParent();
    });
    return super.onLoad();
  }
}
