import 'package:popina/data/data_source/order/data_source.dart';
import 'package:popina/data/models/order.dart';

class OrderRepository {
  OrderRepository(this.remote);

  final DataSource remote;

  Future<List<OrderModel>> orders() {
    return remote.orders();
  }

}
