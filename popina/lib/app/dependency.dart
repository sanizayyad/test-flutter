import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'module.dart';

class AppDependencies extends MultiProvider {
  AppDependencies({Key? key, required this.app, required this.modules})
      : super(
            key: key,
            providers: [
              for (int i = 0; i < modules.length; i += 1)
                ...modules[i].providers
            ],
            child: app);

  final App app;
  final List<AppModule> modules;
}
