import 'dart:async';
import 'package:alquran_kareem/theme/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:alquran_kareem/theme/icons.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 4),
      () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/home',
          (route) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lighBackgroundColor,
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(splashload),
              fit: BoxFit.cover, // Mengisi seluruh ruang yang tersedia
            ),
          ),
        ),
      ),
    );
  }
}
