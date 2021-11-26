// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      object: json['object'] as String?,
      id: json['id'] as int?,
      table: json['table'] as String?,
      guests: json['guests'] as int?,
      date: json['date'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => DishModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'object': instance.object,
      'id': instance.id,
      'table': instance.table,
      'guests': instance.guests,
      'date': instance.date,
      'items': instance.items,
    };
