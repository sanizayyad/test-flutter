import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';

import '../module.dart';

class OtherModule implements AppModule {
  @override
  List<SingleChildWidget> providers = [
    // Provider.value(value: Dio(BaseOptions(baseUrl: env['API_URL']!))),
  ];
}
