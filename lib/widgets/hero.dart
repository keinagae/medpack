import 'package:flutter/material.dart';

class MDPHero extends StatelessWidget {
  final String tag;
  final Widget child;
  final TextStyle? textStyle;
  final Color color;
  final HeroFlightShuttleBuilder? flightShuttleBuilder;

  const MDPHero(
      {Key? key,
      required this.child,
      required this.tag,
      this.color = Colors.transparent,
      this.textStyle,
        this.flightShuttleBuilder
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      flightShuttleBuilder:flightShuttleBuilder ,
        tag: tag,
        child: Material(
          textStyle: textStyle,
          color: color,
          child: child,
        ));
  }
}
