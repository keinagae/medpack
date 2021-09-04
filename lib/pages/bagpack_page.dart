import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:medpack/widgets/buttons.dart';

class BagPackPage extends StatelessWidget {
  const BagPackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xfffafafa),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [MDPBackButton()],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 5, left: 15,bottom: 20),
              child: Text(
                "My BagPack",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Expanded(child: Container(
              
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.05),
                    spreadRadius: 15,
                    blurRadius: 10
                  )
                ]
              ),
            ))
          ]),
        ),
      ),
    );
  }
}
