import 'package:flutter/material.dart';
import 'package:star_wars/core/models/object.model.dart';
import 'package:star_wars/ui/components/model/ui.model.dart';

class SpecieModel extends ObjectModel {
  String id;
  String name;
  String description;
  String imageUrl;
  SpecieModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });
  factory SpecieModel.fromJson(Map<String, dynamic> json) {
    return SpecieModel(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['image'],
    );
  }
  @override
  ItemModel toItem() => ItemModel(image: Image.network(imageUrl), value: name);
}
