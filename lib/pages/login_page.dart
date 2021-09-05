import 'package:flutter/material.dart';
import 'package:medpack/widgets/painters/login_custom_paint.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 300,
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
            Expanded(
              child: TabBarView(
                children: [

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.symmetric(vertical: 20),child: Text("Login",style: Theme.of(context).textTheme.headline2,),),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Email",
                            filled:true,
                            fillColor: Color(0xfff7f7f7),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(20)
                            )
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Password",
                              filled:true,
                              fillColor: Color(0xfff7f7f7),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20)
                              )
                          ),
                        ),
                        Flexible(child: Container()),
                        SizedBox(
                          width: double.infinity,
                            child: ElevatedButton(
                                onPressed: (){},
                                child: Text("Login"),

                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all<double>(0),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                                ))
                              ),
                            ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.symmetric(vertical: 20),child: Text("Signup",style: Theme.of(context).textTheme.headline2,),),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Email",
                              filled:true,
                              fillColor: Color(0xfff7f7f7),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20)
                              )
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Password",
                              filled:true,
                              fillColor: Color(0xfff7f7f7),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20)
                              )
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Re Type Password",
                              filled:true,
                              fillColor: Color(0xfff7f7f7),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(20)
                              )
                          ),
                        ),
                        Flexible(child: Container()),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: (){},
                            child: Text("Signup"),

                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all<double>(0),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ))
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
