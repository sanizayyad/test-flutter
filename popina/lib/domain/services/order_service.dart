import 'dart:async';
import 'package:popina/data/models/order.dart';
import 'package:popina/domain/repository/order/order_repository.dart';
import 'package:stacked/stacked.dart';

class OrderService with ReactiveServiceMixin {
  OrderService(this.orderRepository) {
    listenToReactiveValues([orders]);
  }

  final OrderRepository orderRepository;

  ReactiveList<OrderModel> orders = ReactiveList<OrderModel>();

  Future<List<OrderModel>> fetchOrders() async {
    orders.clear();
    orders.addAll(await orderRepository.orders());
    return orders.toList();
  }

}
