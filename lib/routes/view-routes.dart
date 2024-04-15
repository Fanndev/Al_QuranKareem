import 'package:alquran_kareem/home/screens/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alquran_kareem/home/controllers/detail_controller.dart';
import 'package:alquran_kareem/home/controllers/home_controller.dart';
import 'package:alquran_kareem/home/screens/alquran/home_page.dart';
import 'package:alquran_kareem/home/screens/alquran/detail_page.dart';
import 'package:alquran_kareem/home/bindings/home_bindings.dart';
import 'package:alquran_kareem/home/bindings/detail_bindings.dart';

class Routes {
  static const String splash = '/';
  static const String home = '/home';
  static const String detail = '/detail';
  // Tambahkan rute baru sesuai kebutuhan proyekmu
}

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => SplashPage()
      ),
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.detail,
      page: () => DetailPage(),
      binding: DetailBinding(),
    ),
    // Tambahkan halaman baru sesuai kebutuhan proyekmu
  ];
}
