import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alquran_kareem/theme/theme_color.dart';
import 'package:alquran_kareem/theme/icons.dart';
import 'package:alquran_kareem/routes/view-routes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 4),
      () {
        Get.offNamed(Routes.home);
      },
    );

    return Scaffold(
      backgroundColor: appWhite,
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(splashload),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}