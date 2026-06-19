import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:star_wars/core/router/routes.dart';
import 'package:star_wars/services/auth.service.dart';
import 'package:star_wars/ui/Login_Screen.dart';
import 'package:star_wars/ui/home/home_screen.dart';
import 'package:star_wars/ui/home/home_view_model.dart';
import 'package:star_wars/ui/welcome_screen.dart';

GoRouter appRouter(AuthService auth) => GoRouter(
  refreshListenable: auth,
  initialLocation: Routes.login,
  routes: [
    GoRoute(
      path: Routes.login,
      builder: (context, _) => LoginScreen(authService: context.read()),
      redirect: (context, state) async {
        final loggedIn = await auth.isAuthenticated();
        if(loggedIn) return Routes.home;
        return null;
      },
    ),
    GoRoute(
      path: Routes.home,
      builder: (context, _) => HomeScreen(
        viewModel: HomeViewModel(
          filmService: context.read(),
          planetService: context.read(),
          vehicleService: context.read(),
        ),
      ),
      redirect: (context, state) async {
        final loggedIn = await auth.isAuthenticated();
        if(!loggedIn) return Routes.login;
        final isFirstTime = await auth.isFirstTime();
        if(isFirstTime) return Routes.welcome;
        return null;
      },
    ),
    GoRoute(
      path: Routes.welcome,
      builder: (context, _) => IntroScreenDefault(authService: context.read()),
      redirect: (context, state) async {
        final isFirstTime = await auth.isFirstTime();
        if(!isFirstTime) return Routes.login;
        return null;
      },
    )
  ],
);
