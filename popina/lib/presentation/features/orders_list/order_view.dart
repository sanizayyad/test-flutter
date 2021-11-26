import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popina/app/app.dart';
import 'package:popina/domain/services/order_service.dart';
import 'package:popina/presentation/features/orders_list/order_viewmodel.dart';
import 'package:popina/presentation/navigation/app_route.gr.dart';
import 'package:popina/presentation/theme/app_colors.dart';
import 'package:provider/src/provider.dart';
import 'package:stacked/stacked.dart';

class OrderView extends StatelessWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OrderViewModel>.reactive(
      viewModelBuilder: () =>
          OrderViewModel(orderService: context.read<OrderService>()),
      builder: (context, viewModel, _) => SafeArea(
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: AppColor.appBackgroundColor,
              appBar: AppBar(
                backgroundColor: AppColor.whiteColor,
                title: Text(
                  '${viewModel.numOfOrders} commandes',
                  style: const TextStyle(color: AppColor.grayColor),
                ),
              ),
              body: ListView.builder(
                  itemCount: viewModel.numOfOrders,
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    final order = viewModel.orders[index];
                    final totalPrice = viewModel.totalPrice(order) ?? 0;
                    return GestureDetector(
                      onTap: (){
                        App.router.push(DetailedOrderViewRoute(orderModel: order));
                      },
                      child: Container(
                        height: 100,
                        margin: const EdgeInsets.only(bottom: 16),
                        child: Material(
                          color: AppColor.whiteColor,
                          borderRadius: BorderRadius.circular(16.0),
                          elevation: 1.0,
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 100,
                                margin: const EdgeInsets.only(right: 16),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                    color: AppColor.redAccentColor),
                                child: Text(
                                  '${order.table}',
                                  style: const TextStyle(
                                      color: AppColor.whiteColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment:CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '🙂 ${order.guests}',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    '${order.date}',
                                    style: const TextStyle(
                                        color: AppColor.grayColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              RichText(
                                text: TextSpan(
                                  text: '$totalPrice',
                                  style: const TextStyle(
                                      color: AppColor.grayColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                  children: const <TextSpan>[
                                    TextSpan(
                                        text: ',00€',
                                        style: TextStyle(
                                            color: AppColor.grayColor,
                                            fontWeight: FontWeight.w200,
                                            fontSize: 18)),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16,)
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            if (viewModel.isBusy)
              Positioned.fill(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black26,
                  child: Center(
                    child: Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: EdgeInsets.all(12),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
