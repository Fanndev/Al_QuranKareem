import 'package:alquran_kareem/home/screens/alquran/detail_page.dart';
import 'package:alquran_kareem/home/screens/alquran/home_page.dart';
import 'package:alquran_kareem/home/screens/splash_page.dart';
import 'package:alquran_kareem/theme/fonts.dart';
import 'package:alquran_kareem/theme/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alquran_kareem/home/bindings/home_bindings.dart';
import 'package:alquran_kareem/home/bindings/detail_bindings.dart';
import 'package:alquran_kareem/routes/view-routes.dart';

void main() {
  runApp(alquran_kareem());
}

class alquran_kareem extends StatelessWidget {
  const alquran_kareem({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Al-Quran APP',
      theme: ThemeData(
          scaffoldBackgroundColor: lighBackgroundColor,
          appBarTheme: AppBarTheme(
              backgroundColor: kPrimaryColor,
              elevation: 0,
              centerTitle: true,
              titleTextStyle:
                  whiteTextStyle.copyWith(fontSize: 12, fontWeight: bold))),
      initialRoute: Routes.splash,
      initialBinding: HomeBinding(),
      getPages: AppPages.pages,
    );
  }
}
