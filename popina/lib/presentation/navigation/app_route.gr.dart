// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../data/models/order.dart' as _i6;
import '../features/detailed_order/detailed_order_view.dart' as _i4;
import '../features/error/error_view.dart' as _i5;
import '../features/orders_list/order_view.dart' as _i3;

class AppRoutes extends _i1.RootStackRouter {
  AppRoutes([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    OrderViewRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.OrderView();
        },
        fullscreenDialog: true),
    DetailedOrderViewRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<DetailedOrderViewRouteArgs>();
          return _i4.DetailedOrderView(
              key: args.key, orderModel: args.orderModel);
        }),
    ErrorViewRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i5.ErrorView();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(OrderViewRoute.name, path: '/'),
        _i1.RouteConfig(DetailedOrderViewRoute.name, path: 'detailed-order'),
        _i1.RouteConfig(ErrorViewRoute.name, path: 'error-view')
      ];
}

class OrderViewRoute extends _i1.PageRouteInfo {
  const OrderViewRoute() : super(name, path: '/');

  static const String name = 'OrderViewRoute';
}

class DetailedOrderViewRoute
    extends _i1.PageRouteInfo<DetailedOrderViewRouteArgs> {
  DetailedOrderViewRoute({_i2.Key? key, required _i6.OrderModel orderModel})
      : super(name,
            path: 'detailed-order',
            args: DetailedOrderViewRouteArgs(key: key, orderModel: orderModel));

  static const String name = 'DetailedOrderViewRoute';
}

class DetailedOrderViewRouteArgs {
  const DetailedOrderViewRouteArgs({this.key, required this.orderModel});

  final _i2.Key? key;

  final _i6.OrderModel orderModel;
}

class ErrorViewRoute extends _i1.PageRouteInfo {
  const ErrorViewRoute() : super(name, path: 'error-view');

  static const String name = 'ErrorViewRoute';
}
