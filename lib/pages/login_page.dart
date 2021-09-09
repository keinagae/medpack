import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:medpack/controllers/login_controller.dart';
import 'package:medpack/widgets/auth/login_container.dart';
import 'package:medpack/widgets/auth/signup_container.dart';
import 'package:medpack/widgets/painters/login_custom_paint.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KeyboardVisibilityBuilder(
        builder: (ctx,keyboardVisibility){
          return DefaultTabController(
            length: 2,
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                SafeArea(
                  child: Container(
                    height: keyboardVisibility?null:300,
                    decoration: BoxDecoration(
                        color: Color(0xfff7f7f7),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(17, 17, 26, .05),
                              offset: Offset(0,4),
                              blurRadius: 16
                          ),
                          BoxShadow(
                              color: Color.fromRGBO(17, 17, 26, .05),
                              offset: Offset(0,8),
                              blurRadius: 32
                          )
                        ]
                    ) ,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 70),
                          child: TabBar(
                            tabs: [
                              Tab(
                                child: Text("Login"),
                              ),
                              Tab(
                                child: Text("Signup"),
                              )
                            ],
                            labelColor: Theme.of(context).primaryColor,
                            indicatorColor: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [

                      LoginContainer(),
                      SignupContainer(),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
