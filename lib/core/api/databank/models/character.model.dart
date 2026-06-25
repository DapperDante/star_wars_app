import 'package:flutter/material.dart';
import 'package:star_wars/core/models/object.model.dart';
import 'package:star_wars/ui/components/model/ui.model.dart';

class CharacterModel extends ObjectModel {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  CharacterModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });
  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['image'],
    );
  }
  Map<String, String> get relevantInfo => {
    'name': name,
    'description': description,
  };
  @override
  ItemModel toItem() => ItemModel(image: Image.asset(imageUrl), value: name);
}
