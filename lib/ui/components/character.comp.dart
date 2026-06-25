import 'package:flutter/material.dart';
import 'package:star_wars/core/api/databank/models/character.model.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({super.key, required this.character});
  final CharacterModel character;
  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surfaceContainer,
      borderRadius: BorderRadius.circular(12),
    ),
    clipBehavior: Clip.hardEdge,
    child: Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        spacing: 5,
        children: [
          SizedBox(
            height: 150,
            width: double.infinity,
            child: Image.network(character.imageUrl),
          ),
          Text(character.name),
        ],
      ),
    ),
  );
}
