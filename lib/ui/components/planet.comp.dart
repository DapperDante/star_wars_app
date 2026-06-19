import 'package:flutter/material.dart';
import 'package:star_wars/core/api/swapi/models/planet.model.dart';
import 'package:flip_card/flip_card.dart';

class PlanetCard extends StatelessWidget {
  const PlanetCard({super.key, required this.planet});
  final Planet planet;
  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surfaceContainer,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Padding(
      padding: EdgeInsets.all(10),
      child: FlipCard(
        front: Column(
          spacing: 5,
          children: [Icon(Icons.blur_circular, size: 100), Text(planet.name)],
        ),
        back: Column(
          spacing: 5,
          children: planet.relevantInfo.entries
              .map(
                (entry) => Row(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${entry.key}: '),
                    Expanded(
                      child: Text(
                        entry.value,
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    ),
  );
}
