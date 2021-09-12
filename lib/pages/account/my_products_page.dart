import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:get/get.dart';
import 'package:medpack/constants/routes.dart';
import 'package:medpack/controllers/my_products_controller.dart';
import 'package:medpack/data/modals/product.dart';
import 'package:medpack/widgets/appbars.dart';
import 'package:medpack/widgets/cards.dart';
import 'package:medpack/widgets/hero.dart';

class MyProductsPage extends StatelessWidget {
  MyProductsPage({Key? key}) : super(key: key);
  final controller = Get.put(MyProductsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            NestedAppWidget(
              rightButton: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.addProduct);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [Icon(Icons.add), Text("Medicine")],
                  )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Text(
                "My Medicines",
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Expanded(
                child: RefreshIndicator(
              onRefresh: controller.fetchProducts,
              child: Obx(() => ListView.separated(
                  itemBuilder: (ctx, index) {
                    return MyProductListCard(
                        product: controller.products[index]);
                  },
                  separatorBuilder: (ctx, index) => SizedBox(
                        height: 5,
                      ),
                  itemCount: controller.products.length)),
            ))
          ],
        ),
      ),
    );
  }
}

class MyProductListCard extends StatelessWidget {
  final Product product;
  MyProductListCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MDPLightCard(
      child: ListTile(
        onTap: () {
          Get.toNamed(AppRoutes.myProductsDetail,
              arguments: {"product": product});
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
            Get.toNamed(AppRoutes.addProduct, arguments: {"product": product});
          },
          child: Icon(Entypo.pencil),
        ),
      ),
    );
  }
}
