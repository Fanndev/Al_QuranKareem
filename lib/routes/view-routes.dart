import 'package:get/get.dart';

import 'package:alquran_kareem/home/screens/alquran/detail_page.dart';
import 'package:alquran_kareem/home/screens/alquran/home_page.dart';
import 'package:alquran_kareem/home/screens/alquran/last_read.dart';
import 'package:alquran_kareem/home/screens/splash_page.dart';

import 'package:alquran_kareem/home/bindings/detail_bindings.dart';
import 'package:alquran_kareem/home/bindings/home_bindings.dart';
import 'package:alquran_kareem/home/bindings/last_bindings.dart';

class Routes {
  static const String splash = '/';
  static const String home = '/home';
  static const String detail = '/detail';
  static const String lastRead = '/last_read';
  // Tambahkan rute baru sesuai kebutuhan proyekmu
}

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.detail,
      page: () => DetailPage(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: Routes.lastRead,
      page: () => const Last(),
      binding: LastBinding(),
    ),
    // Tambahkan halaman baru sesuai kebutuhan proyekmu
  ];
}
