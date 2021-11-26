import 'package:flutter/material.dart';
import 'package:popina/app/app.dart';
import 'package:popina/data/models/order.dart';
import 'package:popina/domain/services/order_service.dart';
import 'package:popina/presentation/theme/app_colors.dart';
import 'package:provider/src/provider.dart';
import 'package:stacked/stacked.dart';

import 'detailed_order_view_model.dart';

class DetailedOrderView extends StatelessWidget {
  const DetailedOrderView({Key? key, required this.orderModel})
      : super(key: key);

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DetailedOrderViewModel>.reactive(
      viewModelBuilder: () => DetailedOrderViewModel(orderService: context.read<OrderService>()),
      builder: (context, viewModel, _) => SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: AppColor.appBackgroundColor,
            appBar: AppBar(
              backgroundColor: AppColor.whiteColor,
              title: Text(
                'table ${orderModel.table}',
                style: const TextStyle(color: AppColor.grayColor),
              ),
              leading: IconButton(
                  onPressed: () {
                    App.router.pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColor.grayColor,
                  )),
              bottom: TabBar(
                indicatorColor: AppColor.blueColor,
                labelColor: AppColor.blueColor,
                unselectedLabelColor: AppColor.grayColor,
                onTap: (index) {
                  // Tab index when user select it, it start from zero
                },
                tabs: [
                  Tab(text: "${orderModel.items!.length} produits"),
                  Tab(text: "${viewModel.totalPrice(orderModel)},00€"),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                buildItems(),
                buildItems(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListView buildItems() {
    return ListView.builder(
                  itemCount: orderModel.items?.length ?? 0,
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    final item = orderModel.items![index];
                    String color = item.color!.replaceAll('#', '0xff');
                    return Container(
                      height: 60,
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 40,
                            height: 40,
                            margin: const EdgeInsets.only(right: 16),
                        color: Color(int.parse(color)),
                            child: const Text(
                              '1',
                              style: TextStyle(
                                  color: AppColor.whiteColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24),
                            ),
                          ),
                          Text(
                            '${item.name}',
                            style: TextStyle(
                                color: Color(int.parse(color)),
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                          const Spacer(),
                          Text(
                            '${item.price},00€',
                            style:  TextStyle(
                                color: Color(int.parse(color)),
                                fontWeight: FontWeight.w300,
                                fontSize: 18
                          ),)
                        ],
                      ),
                    );
                  });
  }

}