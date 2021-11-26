import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:popina/app/app.dart';
import 'package:popina/data/models/api_response.dart';
import 'package:popina/presentation/navigation/app_route.gr.dart';


class DataApi {

  Future<ApiResponse> orders() async {
    final response  = await rootBundle.loadString('assets/data.json');

    if(response.isNotEmpty){
      // If the server did return a 200 OK response, then parse the JSON, in this case it's a file.
      await Future.delayed(const Duration(seconds: 2));
      final data = await json.decode(response);
      return ApiResponse.fromJson(data);
    }else{
      App.router.push(const ErrorViewRoute());
      throw Exception('Failed to load Json file');
    }
  }

}
