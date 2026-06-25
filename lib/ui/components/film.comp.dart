import 'package:flutter/material.dart';
import 'package:star_wars/core/api/swapi/models/film.model.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FilmCard extends StatelessWidget {
  const FilmCard({super.key, required this.film, required this.favorite});
  final FilmModel film;
  final Function() favorite;
  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surfaceContainer,
      borderRadius: BorderRadius.circular(12),
    ),
    clipBehavior: Clip.hardEdge,
    child: Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => favorite(),
            icon: Icons.favorite,
            label: 'Favorite',
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: FlipCard(
          front: Column(
            spacing: 5,
            children: [Icon(Icons.movie, size: 100), Text(film.title)],
          ),
          back: Column(
            spacing: 5,
            children: film.relevantInfo.entries
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
    ),
  );
}
