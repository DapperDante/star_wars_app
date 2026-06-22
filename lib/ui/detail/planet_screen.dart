import 'package:flutter/material.dart';
import 'package:star_wars/core/api/swapi/models/planet.model.dart';
import 'package:star_wars/services/planet.service.dart';
import 'package:star_wars/ui/components/model/ui.model.dart';
import 'package:star_wars/ui/components/ui.comp.dart';

class PlanetScreen extends StatefulWidget {
  const PlanetScreen({
    super.key,
    required this.planetService,
    required this.id,
  });
  final String id;

  final PlanetService planetService;
  @override
  State<PlanetScreen> createState() => _PlanetScreenState();
}

class _PlanetScreenState extends State<PlanetScreen> {
  late Future<Planet> _planetFuture;

  @override
  void initState() {
    super.initState();
    _planetFuture = widget.planetService.fetchPlanet(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<Planet>(
        future: _planetFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error fetching planet details.'));
          }
          final planet = snapshot.data!;
          return Center(
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Icon(Icons.blur_circular, size: 200),
                    Text(
                      planet.name,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: CardItems(
                    items: [
                      Item(icon: Icons.people, value: planet.population),
                      Item(icon: Icons.wb_sunny, value: planet.climate),
                      Item(icon: Icons.terrain, value: planet.terrain),
                      Item(icon: Icons.height, value: '${planet.diameter} km'),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
