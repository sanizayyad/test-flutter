import 'package:json_annotation/json_annotation.dart';

import 'order.dart';

part 'api_response.g.dart';

@JsonSerializable()
class ApiResponse {
  String? object;
  List<OrderModel>? orders;

  ApiResponse({ this.object, this.orders});

  factory ApiResponse.fromJson(Map<String, dynamic> json) => _$ApiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}
