import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData get themeDark => ThemeData(
  colorScheme: colorSchemeDark,
  pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  }),
);

ThemeData get themeLight => ThemeData(
  colorScheme: colorSchemeLight,
);

ColorScheme get colorSchemeDark => ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFD50000), // Rojo Sith (Sable de luz)
  onPrimary: Colors.white,
  secondary: Color(0xFF757575), // Gris Imperial (Armaduras y paneles)
  onSecondary: Colors.black,
  error: Color(0xFFFF5252),
  onError: Colors.black,
  surface: Color(0xFF0A0A0A), // Negro del espacio profundo
  onSurface: Color(0xFFE0E0E0), // Texto en gris claro para no cansar la vista
  surfaceContainer: Color(0xFF1A1A1A), // Contenedores ligeramente más claros
  outline: Color(0xFF424242), // Bordes metálicos
);

ColorScheme get colorSchemeLight => ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF1976D2), // Azul Jedi (Sable de Luke/Obi-Wan)
  onPrimary: Colors.white,
  secondary: Color(0xFFE65100), // Naranja X-Wing (Piloto Rebelde)
  onSecondary: Colors.white,
  error: Color(0xFFB00020),
  onError: Colors.white,
  surface: Color(0xFFF4F1EA), // Arena de Tatooine / Blanco hueso
  onSurface: Color(0xFF1C1C1C), // Texto casi negro
  surfaceContainer: Color(0xFFFFFFFF), // Tarjetas y paneles en blanco puro
  outline: Color(0xFFBDBDBD), // Bordes suaves
);