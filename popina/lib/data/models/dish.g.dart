// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DishModel _$DishModelFromJson(Map<String, dynamic> json) => DishModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: json['price'] as int?,
      currency: json['currency'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$DishModelToJson(DishModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'currency': instance.currency,
      'color': instance.color,
    };
