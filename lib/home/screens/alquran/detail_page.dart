import 'package:alquran_kareem/data/model/surah.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:alquran_kareem/home/controllers/detail_controller.dart';

class DetailPage extends GetView<DetailController> {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Menggunakan kontroler GetX untuk mengakses argumen
    final Surah? surah = Get.arguments as Surah?;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SURAH ${surah?.name?.transliteration?.id?.toUpperCase() ?? 'Error..'}',
        ), // Menampilkan nama surah
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    'SURAH ${surah?.name?.transliteration?.id?.toUpperCase() ?? 'Error..'}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    '() ${surah?.name?.transliteration?.id?.toUpperCase() ?? 'Error..'} )',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    '${surah?.numberOfVerses ?? 'Error..'} Ayat | ${surah?.revelation?.id}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
