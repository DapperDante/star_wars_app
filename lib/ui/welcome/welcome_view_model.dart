import 'package:flutter/material.dart';
import 'package:star_wars/services/auth.service.dart';
import 'package:star_wars/services/theme.service.dart';

class WelcomeViewModel {
  WelcomeViewModel({required this._authService, required this._themeService});
  final AuthService _authService;
  final ThemeService _themeService;
  Future<void> completeWelcome() async {
    await _authService.setFirstTime(false);
  }
  String getLogoPath(BuildContext context) {
    return _themeService.getLogoPath(context);
  }
}