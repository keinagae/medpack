import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';

class AmountInput extends StatelessWidget {
  final int value;
  final Function(int) onChanged;

  AmountInput({Key? key, this.value = 1, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          // color: Color(0xfff1f1f1)
        ),
        child: Row(
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: ElevatedButton(
                child: Icon(
                  Entypo.plus,
                ),
                onPressed: () {
                  onChanged(value + 1);
                },
                style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                    elevation: MaterialStateProperty.all<double>(0),
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).canvasColor.withOpacity(1)),
                    foregroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            SizedBox(
              height: 30,
              width: 30,
              child: ElevatedButton(
                child: Text("$value"),
                onPressed: () {},
                style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                    elevation: MaterialStateProperty.all<double>(0),
                    foregroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor),
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).canvasColor)),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            SizedBox(
              height: 30,
              width: 30,
              child: ElevatedButton(
                child: Icon(
                  Entypo.minus,
                ),
                onPressed: () {
                  if (value == 1) {
                    return;
                  }
                  onChanged(value - 1);
                },
                style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                    elevation: MaterialStateProperty.all<double>(0),
                    foregroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor),
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).canvasColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AmountInputLight extends StatelessWidget {
  final int value;
  final Function(int) onChanged;

  AmountInputLight({Key? key, this.value = 1, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          // color: Color(0xfff1f1f1)
        ),
        child: Row(
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: ElevatedButton(
                child: Icon(
                  Entypo.plus,
                ),
                onPressed: () {
                  onChanged(1);
                },
                style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            SizedBox(
              height: 30,
              width: 30,
              child: ElevatedButton(
                child: Text("$value"),
                onPressed: () {},
                style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            SizedBox(
              height: 30,
              width: 30,
              child: ElevatedButton(
                child: Icon(
                  Entypo.minus,
                ),
                onPressed: () {
                  if (value == -1) {
                    return;
                  }
                  onChanged(-1);
                },
                style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
