import 'package:flutter/material.dart';
import 'package:popina/app/app.dart';
import 'package:popina/data/models/order.dart';
import 'package:popina/domain/services/order_service.dart';
import 'package:popina/presentation/theme/app_colors.dart';
import 'package:provider/src/provider.dart';
import 'package:stacked/stacked.dart';

import 'error_view_model.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({Key? key})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ErrorViewModel>.reactive(
      viewModelBuilder: () => ErrorViewModel(orderService: context.read<OrderService>()),
      builder: (context, viewModel, _) => SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.appBackgroundColor,
          body: Column(
            children: [
          const Text(
          'Ooops! Error',
            style: TextStyle(
                color: AppColor.whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 24),
          ),
            TextButton(
                onPressed: ()=> viewModel.tryAgain(),
                child: const Text('Refresh'))
            ],
          ),
        ),
      ),
    );
  }

}