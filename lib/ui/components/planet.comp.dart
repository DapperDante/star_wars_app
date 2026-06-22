import 'package:flutter/material.dart';
import 'package:star_wars/core/api/swapi/models/planet.model.dart';

class PlanetCard extends StatelessWidget {
  const PlanetCard({super.key, required this.planet, this.onTap});
  final Planet planet;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surfaceContainer,
      borderRadius: BorderRadius.circular(12),
    ),
    child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            spacing: 5,
            children: [Icon(Icons.blur_circular, size: 100), Text(planet.name)],
          ),
        ),
      ),
    ),
  );
}
