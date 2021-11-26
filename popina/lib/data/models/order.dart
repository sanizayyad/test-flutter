import 'package:json_annotation/json_annotation.dart';

import 'dish.dart';

part 'order.g.dart';

@JsonSerializable()
class OrderModel {
  String? object;
  int? id;
  String? table;
  int? guests;
  String? date;
  List<DishModel>? items;

  OrderModel({this.object,this.id, this.table, this.guests, this.date, this.items});

  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}