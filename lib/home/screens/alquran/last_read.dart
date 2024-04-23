import 'package:alquran_kareem/data/model/detail_surah.dart' as detail;
import 'package:alquran_kareem/data/model/surah.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:alquran_kareem/home/controllers/detail_controller.dart';

class Last extends GetView<DetailController> {
  const Last({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Surah? surah = Get.arguments as Surah?;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SURAH ${surah?.name?.transliteration?.id?.toUpperCase() ?? 'Error..'}',
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<detail.DetailSurah>(
        future: controller.getDetailSurah(surah!.number.toString()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Terjadi kesalahan: ${snapshot.error}"));
          } else if (!snapshot.hasData) {
            return Center(child: Text("Tidak ada data"));
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SURAH ${surah.name?.transliteration.id.toUpperCase() ?? 'Error..'}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '( ${surah.name?.translation.id.toUpperCase() ?? 'Error..'} )',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
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
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data?.verses?.length ?? 0,
                  itemBuilder: (context, index) {
                    detail.Verse? ayat = snapshot.data?.verses?[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  child: Text('${index + 1}'),
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
                          "${ayat!.text?.arab}",
                          textAlign: TextAlign.end,
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "${ayat!.translation?.id}",
                          textAlign: TextAlign.end,
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(height: 50)
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
