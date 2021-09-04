

import 'package:get/get.dart';
import 'package:medpack/constants/routes.dart';
import 'package:medpack/pages/bagpack_page.dart';
import 'package:medpack/pages/home_page.dart';



List<GetPage> pages=[
  GetPage(name: AppRoutes.bagPage, page: ()=>BagPackPage()),
  GetPage(name: AppRoutes.home, page: ()=>HomePage())
];