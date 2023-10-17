import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/text.dart';

class TextLogoComponent extends TextComponent {
  TextLogoComponent({
    super.text = "坦克大战",
  }) : super(
          textRenderer: TextPaint(
            style: const TextStyle(
              fontSize: 64,
              color: Color(0xFFC8FFF5),
              fontWeight: FontWeight.w800,
            ),
          ),
          anchor: Anchor.center,
        );
}
