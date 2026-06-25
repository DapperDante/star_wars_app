import 'package:flutter/cupertino.dart';
import 'package:star_wars/core/models/object.model.dart';
import 'package:star_wars/ui/components/model/ui.model.dart';

class DroidModel extends ObjectModel {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  DroidModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });
  factory DroidModel.fromJson(Map<String, dynamic> json) {
    return DroidModel(
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
  ItemModel toItem() => ItemModel(
    image: Image.network(imageUrl),
    value: name
  );
}