import 'dart:async';
import 'package:flutter/material.dart';
import 'package:popina/core/utils/logger.dart';
import 'package:popina/data/models/order.dart';
import 'package:popina/domain/services/order_service.dart';
import 'package:stacked/stacked.dart';

class OrderViewModel extends ReactiveViewModel {
  OrderViewModel({
    required this.orderService,
  }){
    fetch();
  }

  final OrderService orderService;

  final log = getLogger('OrderViewModel');

  ValueNotifier<bool> localBusy = ValueNotifier<bool>(false);

  List<OrderModel> get orders => orderService.orders;

  int get numOfOrders => orderService.orders.length;

  Future<void> fetch() async {
    setBusy(true);
    await runBusyFuture(
      orderService.fetchOrders(),
    );
    setBusy(false);

  }

  int? totalPrice(OrderModel order){
    return order.items?.map((e) => e.price).reduce((a, b) => a! + b!);
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [orderService];
}
