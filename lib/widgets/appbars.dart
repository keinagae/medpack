import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'buttons.dart';

class NestedAppWidget extends StatelessWidget {
  final Widget? rightButton;
  NestedAppWidget({Key? key, this.rightButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1.0),
      duration: Duration(milliseconds: 1000),
      builder: (_, double value, Widget? child) {
        return Transform.translate(
          child: Opacity(opacity: value, child: child),
          offset: Offset((1 - value) * -20, 0),
        );
      },
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          width: MediaQuery.of(context).size.width,
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [MDPBackButton(), rightButton ?? Container()],
          ),
        ),
      ),
    );
  }
}
