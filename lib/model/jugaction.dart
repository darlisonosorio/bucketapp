import 'package:bucketapp/constants/colors.dart';
import 'package:bucketapp/constants/texts.dart';
import 'package:flutter/material.dart';

enum JugAction {
  fillX(
    Texts.fillX,
    Icons.keyboard_double_arrow_up_outlined,
    blueColor,
  ),
  fillY(
    Texts.fillY,
    Icons.keyboard_double_arrow_up_outlined,
    pinkColor,
  ),
  emptyX(
    Texts.emptyX,
    Icons.keyboard_double_arrow_down_outlined,
    blueColor,
  ),
  emptyY(
    Texts.emptyY,
    Icons.keyboard_double_arrow_down_outlined,
    pinkColor,
  ),
  transferX(
    Texts.transferX,
    Icons.keyboard_double_arrow_right_outlined,
    blueColor,
  ),
  transferY(
    Texts.transferY,
    Icons.keyboard_double_arrow_left_outlined,
    pinkColor,
  );

  final String text;
  final IconData icon;
  final Color color;

  const JugAction(this.text, this.icon, this.color);

  static JugAction fill(bool reverse) {
    return reverse ? fillY : fillX;
  }

  static JugAction fillB(bool reverse) {
    return reverse ? fillX : fillY;
  }

  static JugAction empty(bool reverse) {
    return reverse ? emptyX : emptyY;
  }

  static JugAction transfer(bool reverse) {
    return reverse ? transferY : transferX;
  }
}
