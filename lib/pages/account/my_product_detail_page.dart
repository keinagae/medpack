import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:get/get.dart';
import 'package:medpack/constants/routes.dart';
import 'package:medpack/data/modals/product.dart';
import 'package:medpack/widgets/appbars.dart';
import 'package:medpack/widgets/hero.dart';

class MYProductDetailPage extends StatelessWidget {
  const MYProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product =
        (Get.arguments as Map<String, dynamic>)['product'] as Product;
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
                          tag: "medicine_image_${product.id}",
                          child: Container(
                            width: double.maxFinite,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30)),
                              child: Image.network(
                                product.image ?? "",
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
                                  tag: "medicine_title_${product.id}",
                                  child: Text(
                                    product.name ?? "",
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
                                            "medicine_description_${product.id}",
                                        child: Text(
                                          product.description ?? "",
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SizedBox.expand(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offNamed(AppRoutes.addProduct,
                          arguments: {"product": product});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Entypo.pencil),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Edit")
                      ],
                    ),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).canvasColor),
                        overlayColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).primaryColor.withOpacity(.1))),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
