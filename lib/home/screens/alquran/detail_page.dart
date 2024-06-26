import 'package:alquran_kareem/data/model/detail_surah.dart' as detail;
import 'package:alquran_kareem/data/model/surah.dart';
import 'package:alquran_kareem/theme/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:alquran_kareem/theme/theme_color.dart';

import 'package:alquran_kareem/home/controllers/detail_controller.dart';

class DetailPage extends GetView<DetailController> {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Menggunakan kontroler GetX untuk mengakses argumen
    final Surah surah = Get.arguments as Surah;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SURAH ${surah.name?.transliteration?.id?.toUpperCase() ?? 'Error..'}',
          style: whiteTextStyle.copyWith(fontSize: 16, fontWeight: bold),
        ), // Menampilkan nama surah
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          GestureDetector(
            onTap: (() => Get.defaultDialog(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  titlePadding: EdgeInsets.symmetric(vertical: 20),
                  title:
                      'Tafsir Surah ${surah.name?.transliteration?.id?.toUpperCase() ?? 'Error..'}',
                  titleStyle: TextStyle(fontWeight: bold),
                  content: Container(
                    child: Text(
                      '${surah.tafsir?.id ?? 'Tidak ada tafsir pada surah ini'}',
                      textAlign: TextAlign.left,
                    ),
                  ),
                )),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      'SURAH ${surah.name?.transliteration?.id?.toUpperCase() ?? 'Error..'}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '(${surah.name?.translation?.id?.toUpperCase() ?? 'Error..'})',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${surah.numberOfVerses ?? 'Error..'} Ayat | ${surah.revelation?.id}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: FutureBuilder<detail.DetailSurah>(
              future: controller.getDetailSurah(surah.number.toString()),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData) {
                  return Center(child: Text("Tidak ada data"));
                }
                return ListView.builder(
                  itemCount: snapshot.data?.verses?.length ?? 0,
                  itemBuilder: (context, index) {
                    detail.Verse? ayat = snapshot.data?.verses?[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    child: Text('${1 + index}'),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.bookmark_add_outlined),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.play_arrow),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "${ayat?.text?.arab}",
                            textAlign: TextAlign.end,
                            style: TextStyle(fontSize: 25),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "${ayat?.translation?.id}",
                            textAlign: TextAlign.end,
                            style: TextStyle(fontSize: 25),
                          ),
                          SizedBox(height: 50)
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
