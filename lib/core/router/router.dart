import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:star_wars/core/router/routes.dart';
import 'package:star_wars/services/auth.service.dart';
import 'package:star_wars/ui/auth/login_screen.dart';
import 'package:star_wars/ui/auth/login_view_model.dart';
import 'package:star_wars/ui/detail/planet_screen.dart';
import 'package:star_wars/ui/home/databank/databank_screen.dart';
import 'package:star_wars/ui/home/databank/databank_view_model.dart';
import 'package:star_wars/ui/home/home/home_screen.dart';
import 'package:star_wars/ui/home/home_layout.dart';
import 'package:star_wars/ui/home/home/home_view_model.dart';
import 'package:star_wars/ui/home/profile/profile_screen.dart';
import 'package:star_wars/ui/home/profile/profile_view_model.dart';
import 'package:star_wars/ui/welcome/welcome_screen.dart';
import 'package:star_wars/ui/welcome/welcome_view_model.dart';

GoRouter appRouter(AuthService auth) => GoRouter(
  refreshListenable: auth,
  initialLocation: Routes.home,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: Routes.login,
      builder: (context, _) => LoginScreen(
        viewModel: LoginViewModel(
          authService: context.read(),
          themeService: context.read(),
        ),
      ),
      redirect: (context, state) async {
        final loggedIn = await auth.isAuthenticated();
        if (loggedIn) return Routes.home;
        return null;
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, _, navigationShell) => HomeLayout(
        navigationShell: navigationShell,
        themeService: context.read(),
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.home,
              builder: (context, _) => HomeScreen(
                viewModel: HomeViewModel(
                  filmService: context.read(),
                  planetService: context.read(),
                  vehicleService: context.read(),
                  prefs: context.read(),
                ),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.databank,
              builder: (context, _) => DatabankScreen(
                viewModel: DatabankViewModel(
                  characterService: context.read(),
                  droidService: context.read(),
                  specieService: context.read(),
                ),
              ),
            )
          ]
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.profile,
              builder: (context, _) => ProfileScreen(
                viewModel: ProfileViewModel(authService: context.read()),
              ),
            ),
          ],
        ),
      ],
      redirect: (context, state) async {
        final loggedIn = await auth.isAuthenticated();
        if (!loggedIn) return Routes.login;
        final isFirstTime = await auth.isFirstTime();
        if (isFirstTime) return Routes.welcome;
        return null;
      },
    ),
    GoRoute(
      path: Routes.welcome,
      builder: (context, _) => WelcomeScreen(
        viewModel: WelcomeViewModel(
          authService: context.read(),
          themeService: context.read(),
        ),
      ),
      redirect: (context, state) async {
        final isFirstTime = await auth.isFirstTime();
        if (!isFirstTime) return Routes.login;
        return null;
      },
    ),
    GoRoute(
      path: '${Routes.planet}/:id',
      builder: (context, state) => PlanetScreen(
        planetService: context.read(),
        id: state.pathParameters['id']!,
      ),
    ),
  ],
);
