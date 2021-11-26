import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../presentation/navigation/app_route.gr.dart';

class App extends StatelessWidget {
  static final router =  AppRoutes();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Popina',
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.defaultRouteParser(),
      routerDelegate: router.delegate(),
    );
  }
}
