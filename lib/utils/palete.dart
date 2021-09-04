import 'package:flutter/material.dart';
class Palette {
  static MaterialColor materialColor(int color){
    return MaterialColor(
      color, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
      <int, Color>{
        50: Color(color).withOpacity(.1),//10%
        100: Color(color).withOpacity(.2),//20%
        200: Color(color).withOpacity(.3),//30%
        300: Color(color).withOpacity(.4),//40%
        400: Color(color).withOpacity(.5),//50%
        500: Color(color).withOpacity(.6),//60%
        600: Color(color).withOpacity(.7),//70%
        700: Color(color).withOpacity(.8),//80%
        800: Color(color).withOpacity(.9),//90%
        900: Color(color),//100%
      },
    );
  }
}