// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';

class Style {
  // VALUES
  static const double GAP_SM = 8;
  static const double GAP_MD = 12;
  static const double GAP_LG = 24;

  static const double TEXT_SM = 8;
  static const double TEXT_MD = 12;
  static const double TEXT_LG = 24;

  // COLORS
  static const Color PRIMARY = Color(0xEE0C8050);

  // PADDINGS
  static const PADDING_MD = EdgeInsets.all(GAP_MD);

  // STYLES
  static final ELEVATED_BUTTON_PRIMARY = ElevatedButton.styleFrom(
    primary: PRIMARY,
  );
  static const TEXT_MD_BOLD_PRIMARY = TextStyle(
    fontSize: TEXT_MD,
    fontWeight: FontWeight.bold,
    color: PRIMARY,
  );
  static const TEXT_LG_300_WHITE = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w300,
    fontSize: TEXT_LG,
  );

  // DECORATIONS
  static InputDecoration textFieldStyle(String hintText) {
    return InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(GAP_SM),
      ),
    );
  }
}
