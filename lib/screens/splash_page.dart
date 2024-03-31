import 'dart:async';
import 'package:alquran_kareem/theme/theme_color.dart';
import 'package:flutter/material.dart';

class SplahPage extends StatefulWidget {
  const SplahPage({super.key});

  @override
  State<SplahPage> createState() => _SplahPageState();
}

class _SplahPageState extends State<SplahPage> {
  @override
  //Fungsi initState dalam kode adalah bagian dari lifecycle stateful widget dalam Flutter. Fungsi ini dijalankan ketika widget dibuat dan siap untuk digunakan. Dalam konteks yang diberikan, fungsi ini mengandung kode
  //yang akan menjalankan navigasi otomatis ke halaman /home_page setelah dua detik setelah widget dibuat.
  //Digunakan Timer untuk mengatur jeda, dan kemudian akan berpindah ke halaman berikutnya

  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
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
          width: 164,
          height: 164,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(''))
          ),
        ),
      ),
    );
  }
}