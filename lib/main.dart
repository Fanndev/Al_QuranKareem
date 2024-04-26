import 'package:alquran_kareem/theme/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alquran_kareem/home/bindings/home_bindings.dart';
import 'package:alquran_kareem/routes/view-routes.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  final box = GetStorage();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Al-Quran APP',
    theme: box.read('themeDark') == null ? themeLight : themeDark,
    initialRoute: Routes.home,
    initialBinding: HomeBinding(),
    getPages: AppPages.pages,
  ));
}
