import 'package:alquran_kareem/theme/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alquran_kareem/home/bindings/home_bindings.dart';
import 'package:alquran_kareem/routes/view-routes.dart';

void main() {
  runApp(alquran_kareem());
}

class alquran_kareem extends StatelessWidget {
  const alquran_kareem({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Al-Quran APP',
      theme: themeLight,
      darkTheme: themeDark,
      initialRoute: Routes.home,
      initialBinding: HomeBinding(),
      getPages: AppPages.pages,
    );
  }
}
