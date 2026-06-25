import 'package:star_wars/ui/components/model/ui.model.dart';

abstract class ObjectModel {
  ObjectModel();
  factory ObjectModel.fromJson(Map<String, dynamic> json) => throw UnimplementedError();
  ItemModel toItem();
}