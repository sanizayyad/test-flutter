
import 'package:popina/app/app.dart';
import 'package:popina/core/utils/logger.dart';
import 'package:popina/domain/services/order_service.dart';
import 'package:popina/presentation/features/orders_list/order_viewmodel.dart';
import 'package:popina/presentation/navigation/app_route.gr.dart';

class ErrorViewModel extends OrderViewModel {
  ErrorViewModel({required OrderService orderService}) : super(orderService: orderService);


  final log = getLogger('DetailedOrderViewModel');

  void tryAgain(){
    fetch();
    App.router.push(const OrderViewRoute());
  }

}
