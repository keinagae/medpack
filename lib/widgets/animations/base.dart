import "package:flutter/material.dart";
import 'package:lottie/lottie.dart';

class BaseAanimation extends StatelessWidget {
  String file;
  String msg;
  BaseAanimation({Key? key, this.file = "", this.msg = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(height: 150, width: 150, child: Lottie.asset(file)),
          Text(msg)
        ],
      ),
    );
  }
}

class EmptyBagAnimation extends StatelessWidget {
  const EmptyBagAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseAanimation(
        file: "assets/animations/9091-empty-sad-shopping-bag.json",
        msg: "Bag Is empty");
  }
}

class EmptyAnimation extends StatelessWidget {
  final String msg;
  EmptyAnimation({Key? key, this.msg: ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseAanimation(file: "assets/animations/13525-empty.json", msg: msg);
  }
}

class LoadingAnimation extends StatelessWidget {
  final String msg;
  LoadingAnimation({Key? key, this.msg: ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseAanimation(
        file:
            "assets/animations/11210-quotes-loading-screen-policybazaarcom.json",
        msg: msg);
  }
}

class FetchAnimation extends StatelessWidget {
  final bool isLoading;
  final bool isEmpty;
  final String loadingMsg;
  final String emptyMsg;
  final Widget child;
  FetchAnimation(
      {Key? key,
      this.emptyMsg: "Unable to find anything",
      this.isEmpty: false,
      this.isLoading = false,
      this.loadingMsg: "Loading please wait..",
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return LoadingAnimation(
        msg: loadingMsg,
      );
    } else if (isEmpty) {
      return EmptyAnimation(
        msg: emptyMsg,
      );
    }
    return child;
  }
}
