import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class ColorBackground extends Component {
  ColorBackground({this.color = Colors.green});
  final Color color;

  @override
  void render(Canvas canvas) {
    canvas.drawColor(color, BlendMode.srcATop);
  }
}
