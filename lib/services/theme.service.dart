import 'package:flutter/material.dart';

class ThemeService {
  String getLogoPath(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark
        ? 'assets/imperio.png'
        : 'assets/rebelde.png';
  }
  String getMessage(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark
        ? 'Welcome to the empire'
        : 'Welcome to the rebellion';
  }
}