import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:star_wars/core/api/swapi/models/vehicle.model.dart';

class VehicleCard extends StatelessWidget {
  const VehicleCard({super.key, required this.vehicle});
  final Vehicle vehicle;
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
          children: [
            Icon(Icons.directions_car, size: 100),
            Expanded(
              child: Text(
                vehicle.name,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        back: Column(
          spacing: 3,
          children: vehicle.relevantInfo.entries
              .map(
                (entry) => Row(
                  spacing: 5,
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
