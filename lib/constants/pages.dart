

import 'package:get/get.dart';
import 'package:medpack/constants/routes.dart';
import 'package:medpack/pages/bagpack_page.dart';
import 'package:medpack/pages/home_page.dart';
import 'package:medpack/pages/login_page.dart';
import 'package:medpack/pages/medicine_detail_page.dart';



List<GetPage> pages=[
  GetPage(name: AppRoutes.bagPage, page: ()=>BagPackPage()),
  GetPage(name: AppRoutes.home, page: ()=>HomePage()),
  GetPage(name: AppRoutes.login, page: ()=>LoginPage()),
  GetPage(name: AppRoutes.detail, page: ()=>MedicineDetailPage())
];