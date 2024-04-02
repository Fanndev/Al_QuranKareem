import 'package:alquran_kareem/screens/alquran/detail_page.dart';
import 'package:alquran_kareem/screens/alquran/home_page.dart';
import 'package:alquran_kareem/screens/splash_page.dart';
import 'package:alquran_kareem/theme/fonts.dart';
import 'package:alquran_kareem/theme/theme_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(alquran_kareem());
}

class alquran_kareem extends StatelessWidget {
  const alquran_kareem({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      // Routes sebagai jalur navigator halaman
      routes: {
        '/': (context) => const SplashPage(),
        '/home': (context) => const HomePage(),
        '/detail': (context) => const DetailPage()
      },
    );
  }
}
