import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData get themeDark => ThemeData(
  colorScheme: colorSchemeDark,
  pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  }),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: colorSchemeDark.primary,
      foregroundColor: colorSchemeDark.onPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
  ),
);

ThemeData get themeLight => ThemeData(
  colorScheme: colorSchemeLight,
  pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  }),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: colorSchemeLight.primary,
      foregroundColor: colorSchemeLight.onPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
  ),
);

ColorScheme get colorSchemeDark => ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFD50000),
  onPrimary: Colors.white,
  secondary: Color(0xFF757575),
  onSecondary: Colors.black,
  error: Color(0xFFFF5252),
  onError: Colors.black,
  surface: Color(0xFF0A0A0A), 
  onSurface: Color(0xFFE0E0E0), 
  surfaceContainer: Color(0xFF1A1A1A), 
  outline: Color(0xFF424242),
  tertiary: Color(0xFF4CAF50),
  onTertiary: Colors.black,
);

ColorScheme get colorSchemeLight => ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF1976D2),
  onPrimary: Colors.white,
  secondary: Color(0xFFE65100),
  onSecondary: Colors.white,
  tertiary: Color(0xFF00BFA5), 
  error: Color(0xFFB00020),
  onError: Colors.white,
  surface: Color(0xFFF4F1EA),  
  onSurface: Color(0xFF1C1C1C),
  surfaceContainer: Color(0xFFFFFFFF),
  outline: Color(0xFFBDBDBD),
  onTertiary: Colors.white,           
);