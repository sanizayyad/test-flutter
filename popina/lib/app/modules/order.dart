import 'package:popina/data/data_source/order/data_api.dart';
import 'package:popina/data/data_source/order/data_source_impl.dart';
import 'package:popina/domain/repository/order/order_repository.dart';
import 'package:popina/domain/services/order_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:dio/dio.dart';

import '../module.dart';

class OrderModule implements AppModule {
  @override
  List<SingleChildWidget> providers = [
    Provider(
      create: (context) => DataApi(),
    ),
    Provider(
        create: (context) => OrderService(OrderRepository(
              DataSourceImpl(context.read<DataApi>()),
            )))
  ];
}
