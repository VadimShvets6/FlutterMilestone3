import 'package:flutter/material.dart';

extension MyElevatedStyle on ElevatedButton {
  static ButtonStyle blackButtonStyle() => ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(46),
        backgroundColor: Colors.black,
        foregroundColor: Colors.grey,
      );
}

extension MyTextStyle on TextStyle {
  static titleStyle({Color color = Colors.black, FontWeight weight = FontWeight.w500, double textSize = 14}) =>
      TextStyle(fontWeight: weight, fontFamily: 'Roboto', fontSize: textSize, color: color);

  static semiBoldStyle([double textSize = 18]) =>
      TextStyle(fontWeight: FontWeight.w700, color: Colors.white, fontFamily: 'Roboto', fontSize: textSize);
}
