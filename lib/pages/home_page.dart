import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:get/get.dart';
import 'package:medpack/constants/routes.dart';
import 'package:medpack/controllers/cart_controller.dart';
import 'package:medpack/controllers/medicine_list_controller.dart';
import 'package:medpack/controllers/products_controller.dart';
import 'package:medpack/data/modals/medicine_tile.dart';
import 'package:medpack/data/modals/product.dart';
import 'package:medpack/pages/medicine_detail_page.dart';
import 'package:medpack/widgets/buttons.dart';
import 'package:medpack/widgets/cards.dart';
import 'package:medpack/widgets/hero.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final controller = Get.put(ProductsController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Entypo.menu),
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                  ),
                  Obx(() => IconTextButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.bagPage);
                        },
                        icon: Icon(Entypo.bag),
                        text: Text("${cartController.cartQuantity}"),
                      ))
                ],
              ),
            ),
            MDPCard(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Looking for medicine",
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(fontSize: 24),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          // isCollapsed: true,
                          isDense: true,
                          hintText: "Search",
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          prefixIcon: Icon(Entypo.search)),
                    ),
                  )
                ],
              ),
            ),
            Flexible(
                flex: 1,
                child: Obx(() => ListView.separated(
                    itemBuilder: (ctx, index) => ProductListCard(
                          product: controller.products[index],
                        ),
                    separatorBuilder: (ctx, index) => Container(),
                    itemCount: controller.products.length)))
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {
                Get.toNamed(AppRoutes.account);
              },
              child: Icon(Entypo.user),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColor.withOpacity(.2))),
            ),
            TextButton(
              onPressed: () {},
              child: Icon(Entypo.home),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColor.withOpacity(.2))),
            ),
            TextButton(
              onPressed: () {},
              child: Icon(Entypo.list),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColor.withOpacity(.2))),
            )
          ],
        ),
      ),
    );
  }
}

class ProductListCard extends StatelessWidget {
  final Product product;
  ProductListCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MDPLightCard(
      child: ListTile(
        onTap: () {
          Get.toNamed(AppRoutes.detail, arguments: {"medicine": product});
        },
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
              child: MDPHero(
                  tag: "medicine_image_${product.id}",
                  child: Image.network(
                    product.image ?? "",
                    fit: BoxFit.cover,
                  ))),
        ),
        title: MDPHero(
          tag: "medicine_title_${product.id}",
          color: Theme.of(context).canvasColor,
          child: Text(product.name ?? ""),
        ),
        subtitle: MDPHero(
          tag: "medicine_description_${product.id}",
          child: Container(
            constraints: BoxConstraints(maxHeight: 100),
            child: Text(
              product.description ?? "",
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        trailing: TextButton(
          onPressed: () {
            final cartController = Get.find<CartController>();
            cartController.addToCart(product: product, quantity: 1);
          },
          child: Icon(Entypo.bag),
        ),
      ),
    );
  }
}
