
import 'package:popina/data/models/order.dart';

import 'data_api.dart';

abstract class DataSource {
  DataSource(this.dataApi);

  final DataApi dataApi;

  Future<List<OrderModel>> orders();

}
