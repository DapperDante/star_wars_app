import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:star_wars/core/api/auth/api_auth_client.dart';
import 'package:star_wars/core/api/swapi/api_swapi_client.dart';
import 'package:star_wars/services/SharedPreferences.service.dart';
import 'package:star_wars/services/auth.service.dart';
import 'package:star_wars/services/film.service.dart';
import 'package:star_wars/services/planet.service.dart';
import 'package:star_wars/services/vehicle.service.dart';

List<SingleChildWidget> providers = [
  Provider(create: (_) => ApiSwapiClient()),
  Provider(create: (_) => ApiAuthClient()),
  Provider(create: (_) => SharedPreferencesService()),
  Provider(
    create: (context) => PlanetService(api: context.read<ApiSwapiClient>().client),
  ),
  Provider(
    create:(context) => FilmService(api: context.read<ApiSwapiClient>().client),
  ),
  Provider(
    create: (context) => VehicleService(api: context.read<ApiSwapiClient>().client),
  ),
  ChangeNotifierProvider(
    create: (context) => AuthService(api: context.read<ApiAuthClient>().client, prefs: context.read()),
  )
];
