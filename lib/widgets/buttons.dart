import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:get/get.dart';

class MDPBackButton extends StatelessWidget {
  const MDPBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      child: Center(
        child: TextButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).canvasColor),
            ),
            onPressed: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back)),
      ),
    );
  }
}

class RectIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  RectIconButton({Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: TextButton(
        onPressed: onPressed,
        child: Icon(icon),
      ),
    );
  }
}

class DetailAddToCartButton extends StatelessWidget {
  const DetailAddToCartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Entypo.bag),
          SizedBox(
            width: 10,
          ),
          Text("Add To Bag"),
        ],
      ),
      style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          foregroundColor:
              MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
          backgroundColor:
              MaterialStateProperty.all<Color>(Theme.of(context).canvasColor),
          overlayColor: MaterialStateProperty.all<Color>(
              Theme.of(context).primaryColor.withOpacity(.3)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
    );
  }
}
