import 'package:flutter/material.dart';

class SimpleChip extends StatelessWidget {
  final Text label;
  final Color? color;
  SimpleChip({Key? key, required this.label, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: label,
      backgroundColor: color?.withOpacity(.3) ??
          Theme.of(context).primaryColor.withOpacity(.3),
      labelStyle: Theme.of(context)
          .chipTheme
          .labelStyle
          .copyWith(color: color ?? Theme.of(context).primaryColor),
      visualDensity: VisualDensity(vertical: -3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
    );
  }
}
