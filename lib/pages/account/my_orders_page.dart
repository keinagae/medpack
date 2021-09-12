import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medpack/constants/constants.dart';
import 'package:medpack/controllers/order_controller.dart';
import 'package:medpack/data/modals/order.dart';
import 'package:medpack/widgets/appbars.dart';
import 'package:medpack/widgets/cards.dart';
import 'package:medpack/widgets/chip.dart';

class MyOrderPage extends StatelessWidget {
  MyOrderPage({Key? key}) : super(key: key);
  final controller = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            NestedAppWidget(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Text(
                "My Requests",
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Expanded(
                child: Obx(() => ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    itemBuilder: (ctx, index) {
                      return MyOrderCard(order: controller.orders[index]);
                    },
                    separatorBuilder: (ctx, index) => SizedBox(
                          height: 5,
                        ),
                    itemCount: controller.orders.length)))
          ],
        ),
      ),
    );
  }
}

class MyOrderCard extends StatelessWidget {
  MyOrderCard({Key? key, required this.order}) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    final status = ORDER_STATUSES[order.status];

    return MDPCard(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Request # ${order.id}",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SimpleChip(
                      label: Text("${status!['text']}"),
                      color: status['color'] as Color,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Requested At",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      "${DateFormat.yMEd().add_jms().format(order.createdAt)}",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
                Divider(),
                Text(
                  "Medicines:",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            child: Column(
              children: [
                ...order.items
                    .map((e) => MyOrderItemWidget(
                          item: e,
                        ))
                    .toList()
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyOrderItemWidget extends StatelessWidget {
  final OrderItem item;
  const MyOrderItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MDPLightCard(
      child: ListTile(
        onTap: () {},
        leading: Container(
          height: 50,
          width: 50,
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                //box-shadow: rgba(17, 17, 26, 0.05) 0px 4px 16px, rgba(17, 17, 26, 0.05) 0px 8px 32px;
                BoxShadow(
                    color: Color.fromRGBO(17, 17, 26, .05),
                    offset: Offset(0, 4),
                    blurRadius: 16),
                BoxShadow(
                    color: Color.fromRGBO(17, 17, 26, .05),
                    offset: Offset(0, 8),
                    blurRadius: 32)
              ]),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                item.product?.image ?? "",
                fit: BoxFit.cover,
              )),
        ),
        title: Text(item.product?.name ?? ""),
        subtitle: Container(
          constraints: BoxConstraints(maxHeight: 100),
          child: Text(
            item.product?.description ?? "",
            overflow: TextOverflow.ellipsis,
          ),
        ),
        trailing: TextButton(
          onPressed: () {},
          child: Text("${item.quantity}"),
        ),
      ),
    );
  }
}
