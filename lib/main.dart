import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:star_wars/core/dependencies.dart';
import 'package:star_wars/core/router/router.dart';
import 'package:star_wars/core/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: providers,
    child: Builder(
      builder: (context) => MaterialApp.router(
        routerConfig: appRouter(context.read()),
        theme: themeLight,
        darkTheme: themeDark,
      ),
    ),
  );
}
