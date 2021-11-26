import 'package:auto_route/annotations.dart';
import 'package:popina/presentation/features/detailed_order/detailed_order_view.dart';
import 'package:popina/presentation/features/error/error_view.dart';
import 'package:popina/presentation/features/orders_list/order_view.dart';


@AdaptiveAutoRouter(preferRelativeImports: true, routes: [
  AutoRoute(initial: true, fullscreenDialog: true, page: OrderView),
  AutoRoute(page: DetailedOrderView, path: 'detailed-order'),
  AutoRoute(page: ErrorView, path: 'error-view'),
])
class $AppRoutes {}
