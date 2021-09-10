import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:get/get.dart';
import 'package:medpack/constants/routes.dart';
import 'package:medpack/controllers/cart_controller.dart';
import 'package:medpack/controllers/medicine_list_controller.dart';
import 'package:medpack/widgets/buttons.dart';
import 'package:medpack/widgets/hero.dart';

class BagPackPage extends StatelessWidget {
  BagPackPage({Key? key}) : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [MDPBackButton()],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(top: 5, left: 15, bottom: 20),
            child: Text(
              "My BagPack",
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: Color(0xfff7f7f7),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      spreadRadius: -6,
                      blurRadius: 25,
                      offset: Offset(0, -4))
                ]),
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              itemBuilder: (ctx, int index) {
                final item = controller.cart.value.items[index];
                return InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.detail,
                        arguments: {"medicine": item.product});
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(.04),
                              blurRadius: 12)
                          //box-shadow: rgba(0, 0, 0, 0.09) 0px 3px 12px;
                        ]),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 70,
                              width: 70,
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
                                  child: MDPHero(
                                      tag: "medicine_image_${item.product?.id}",
                                      child: Image.network(
                                        item.product?.image ?? "",
                                        fit: BoxFit.cover,
                                      ))),
                            ),
                            Flexible(
                                child: Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MDPHero(
                                      tag: "medicine_title_${item.product?.id}",
                                      child: Text(
                                        item.product?.name ?? "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      )),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Qty: ${item.quantity}")
                                ],
                              ),
                            ))
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: controller.cart.value.items.length,
              separatorBuilder: (ctx, int index) => SizedBox(
                height: 20,
              ),
            ),
          )),
          Container(
            height: 60,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Submit Request"),
            ),
          )
        ]),
      ),
    );
  }
}
