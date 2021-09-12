import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:get/get.dart';
import 'package:medpack/controllers/product_detail_controller.dart';
import 'package:medpack/data/modals/medicine_tile.dart';
import 'package:medpack/data/modals/product.dart';
import 'package:medpack/widgets/appbars.dart';
import 'package:medpack/widgets/buttons.dart';
import 'package:medpack/widgets/hero.dart';
import 'package:medpack/widgets/inputs/number_input.dart';

class MedicineDetailPage extends StatelessWidget {
  MedicineDetailPage({Key? key}) : super(key: key);

  final controller = Get.put(ProductDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        height: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                  ),
                  // color: Theme.of(context).canvasColor,
                  // height: MediaQuery.of(context).size.height*.92,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        height: MediaQuery.of(context).size.height * .50,
                        child: MDPHero(
                          tag: "medicine_image_${controller.product.value.id}",
                          child: Container(
                            width: double.maxFinite,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30)),
                              child: Image.network(
                                controller.product.value.image ?? "",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: NestedAppWidget(),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: MediaQuery.of(context).size.height * .5,
                        bottom: 0,
                        child: SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            height:
                                (MediaQuery.of(context).size.height * .5) - 40,
                            decoration: BoxDecoration(
                                color: Theme.of(context).canvasColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                MDPHero(
                                  tag:
                                      "medicine_title_${controller.product.value.id}",
                                  child: Text(
                                    controller.product.value.name ?? "",
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: Text("Description"),
                                          style: ButtonStyle(
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10))),
                                              elevation: MaterialStateProperty
                                                  .all<double>(0)),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: MDPHero(
                                        tag:
                                            "medicine_description_${controller.product.value.id}",
                                        child: Text(
                                          controller
                                                  .product.value.description ??
                                              "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1!
                                              .copyWith(
                                                  color: Color(0xff808080)),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 65,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Obx(() => AmountInput(
                        value: controller.quantity,
                        onChanged: (value) {
                          controller.quantity = value;
                        },
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(child: DetailAddToCartButton(
                    onPressed: () {
                      if (controller.quantity >
                          controller.product.value.quantity) {
                        Get.snackbar(
                            "Insufficient Quantity", "Not enough quantity");
                        return;
                      }
                      controller.addQuantityToCart();
                    },
                  )),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
