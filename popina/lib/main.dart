import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';
import 'app/dependency.dart';
import 'app/modules/order.dart';
import 'app/modules/other.dart';

// const String kDevEnv = 'dev.env';
// const String kProdEnv = 'prod.env';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await load(fileName: kDevEnv);
  Provider.debugCheckInvalidValueType = null;


  runApp(AppDependencies(
    app: App(),
    modules: [OtherModule(), OrderModule()],
  ));
}
