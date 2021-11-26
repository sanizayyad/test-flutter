
import 'package:popina/core/utils/logger.dart';
import 'package:popina/domain/services/order_service.dart';
import 'package:popina/presentation/features/orders_list/order_viewmodel.dart';
import 'package:stacked/stacked.dart';

class DetailedOrderViewModel extends OrderViewModel {
  DetailedOrderViewModel({required OrderService orderService}) : super(orderService: orderService);


  final log = getLogger('DetailedOrderViewModel');


}
