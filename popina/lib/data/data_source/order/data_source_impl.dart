import 'package:popina/data/models/order.dart';

import 'data_api.dart';
import 'data_source.dart';

class DataSourceImpl implements DataSource {
  DataSourceImpl(this.dataApi);

  final DataApi dataApi;

  @override
  Future<List<OrderModel>> orders() async{
    final res = await dataApi.orders();
    return res.orders ?? [];
  }

}
