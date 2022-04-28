import 'package:flutter/material.dart';
import '../ui/ecommerce_style.dart';

class ThemeModel {
  static const int theme1 = 1, theme3 = 3;
  static int value = theme3;
  static bool get isTheme1 => value == theme1;
  static bool get isTheme3 => value == theme3;
  static String get font {
    switch(value) {
      case theme3: return 'helvetica-neue';
      default: return 'Roboto';
    }
  }

  static void setPrimaryColor() {
    switch (value) {
      case theme3 : ECommerceStyle.primaryColor = const Color(0xFF00CAA5); break;
      default: ECommerceStyle.primaryColor = const Color(0xFFE46F32);
    }
  }
}