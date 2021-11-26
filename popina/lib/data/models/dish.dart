import 'package:json_annotation/json_annotation.dart';


part 'dish.g.dart';


@JsonSerializable()
class DishModel {
  int? id;
  String? name;
  int? price;
  String? currency;
  String? color;

  DishModel(
      {this.id, this.name, this.price, this.currency, this.color});

  factory DishModel.fromJson(Map<String, dynamic> json) =>
      _$DishModelFromJson(json);

  Map<String, dynamic> toJson() => _$DishModelToJson(this);
}