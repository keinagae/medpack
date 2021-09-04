import 'package:flutter/material.dart';
class MDPCard extends StatelessWidget {
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Widget? child;
  const MDPCard({
    Key? key,
    this.padding=const EdgeInsets.all(10),
    this.margin=const EdgeInsets.all(10),
    this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: Color(0xfffbfbfb),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.03),
            blurRadius: 10,
            spreadRadius: 4
          )
        ]
      ),
      child: child,
    );
  }
}
class MDPLightCard extends StatelessWidget {
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Widget? child;
  const MDPLightCard({
    Key? key,
    this.padding=const EdgeInsets.all(10),
    this.margin=const EdgeInsets.all(10),
    this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
          color: Color(0xfffefefe),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.03),
                blurRadius: 10,
                spreadRadius: 9
            )
          ]
      ),
      child: child,
    );
  }
}
