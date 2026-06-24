import 'package:flutter/material.dart';
import 'package:star_wars/services/auth.service.dart';
import 'package:star_wars/services/theme.service.dart';

class LoginViewModel {
  LoginViewModel({required this._authService, required this._themeService});
  final AuthService _authService;
  final ThemeService _themeService; 
  Future<bool> login(String email, String password) async {
    return await _authService.login(email, password);
  }
  String getLogoPath(BuildContext context){
    return _themeService.getLogoPath(context);
  }
}