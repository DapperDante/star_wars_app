import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_wars/core/api/swapi/models/film.model.dart';
import 'package:star_wars/core/api/swapi/models/planet.model.dart';
import 'package:star_wars/core/api/swapi/models/vehicle.model.dart';
import 'package:star_wars/core/router/routes.dart';
import 'package:star_wars/ui/components/film.comp.dart';
import 'package:star_wars/ui/components/planet.comp.dart';
import 'package:star_wars/ui/components/vehicle.comp.dart';
import 'package:star_wars/ui/home/home/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.viewModel});
  final HomeViewModel viewModel;
  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  late Future<List<Planet>> _planetsFuture;
  late Future<List<Film>> _filmsFuture;
  late Future<List<Vehicle>> _vehiclesFuture;
  @override
  void initState() {
    super.initState();
    _planetsFuture = widget.viewModel.fetchPlanets();
    _filmsFuture = widget.viewModel.fetchFilms();
    _vehiclesFuture = widget.viewModel.fetchVehicles();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      children: [
        FutureBuilder<List<Planet>>(
          future: _planetsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SizedBox.square(
                  dimension: 100,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            return CarouselSlider(
              items: snapshot.data!
                  .map(
                    (i) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PlanetCard(
                        planet: i,
                        onTap: () => context.push('${Routes.planet}/${i.id}')
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(height: 180),
            );
          },
        ),
        FutureBuilder<List<Film>>(
          future: _filmsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            return Column(
              children: snapshot.data!
                  .map(
                    (i) => Padding(
                      padding: EdgeInsets.all(8),
                      child: FilmCard(
                        film: i,
                        favorite: () {
                          final snackBar = SnackBar(
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              title: "Added to Favorites",
                              message: "${i.title} added to favorites",
                              contentType: ContentType.success,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                      ),
                    ),
                  )
                  .toList(),
            );
          },
        ),
        FutureBuilder<List<Vehicle>>(
          future: _vehiclesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            return CarouselSlider(
              options: CarouselOptions(height: 170),
              items: snapshot.data!
                  .map(
                    (i) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: VehicleCard(vehicle: i),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ],
    ),
  );
}
