import 'package:alquran_kareem/data/model/juz.dart' as juz;
import 'package:alquran_kareem/theme/icons.dart';
import 'package:alquran_kareem/theme/theme_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DetailJuz extends StatelessWidget {
  DetailJuz({super.key});

  final juz.Juz detailJuz = Get.arguments as juz.Juz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Juz ${detailJuz.juz}'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: detailJuz.verses?.length ?? 0,
        itemBuilder: (context, index) {
          if (detailJuz.verses != null || detailJuz.verses!.length == 0) {
            return Center(
              child: Text('Data API Error'),
            );
          }
          juz.Verses ayat = detailJuz.verses![index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color:
                        Get.isDarkMode ? appWhite : appBlue.withOpacity(0.10)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Get.isDarkMode
                                    ? bingkaiputih
                                    : bingkaihitam),
                                fit: BoxFit.contain),
                          ),
                          child: Center(child: Text('${index + 1}')),
                        ),
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
                "${ayat.text?.arab}",
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(height: 30),
              Text(
                "${ayat.translation?.id}",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(height: 50)
            ],
          );
        },
      ),
    );
  }
}
