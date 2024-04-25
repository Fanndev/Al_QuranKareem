// import 'dart:convert';
// import 'package:alquran_kareem/data/model/ayat.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alquran_kareem/data/model/detail_surah.dart';
import 'package:http/http.dart' as http;
import 'package:alquran_kareem/main.dart';

void main() async {
  int juz = 1;

  List<Verse> penampunganAyat = [];
  List<Map<String, dynamic>> allJuz = [];

  for (var i = 0; i < 114; i++) {
    var res =
        await http.get(Uri.parse("https://api.quran.gading.dev/surah/$i/1"));
    Map<String, dynamic> rawData = jsonDecode(res.body)["data"];
    DetailSurah data = DetailSurah.fromJson(rawData);

    if (data.verses != null) {
      //

      data.verses!.forEach((ayat) {
        if (ayat.meta?.juz == juz) {
          penampunganAyat.add(ayat);
        } else {
          print('==========================');
          print('berhasil memasukkan juz $juz');
          print(penampunganAyat[0].text?.arab);
          allJuz.add({
            'juz': juz,
            'surah': data.name?.transliteration?.id ?? '',
            'start': penampunganAyat[0],
            'end': penampunganAyat[penampunganAyat.length - 1],
            'verses': penampunganAyat,
          });
          juz++;
          penampunganAyat.clear();
          penampunganAyat.add(ayat);
        }
      });
    }
  }

  // var res = await http.get(Uri.parse("https://api.quran.gading.dev/surah/108/1"));
  // Map<String, dynamic> data = jsonDecode(res.body)["data"];
  // Map<String, dynamic> dataModel = {
  //   "number": data["number"],
  //   "meta": data["meta"],
  //   "text": data["text"],
  //   "translation": data["translation"],
  //   "audio": data["audio"],
  //   "tafsir": data["tafsir"],
  // };

  // Ayat ayat = Ayat.fromJson(data);
  // print(ayat.audio.primary);

//  Future<void> printDetailSurah(String id) async {
//     try {
//       Uri url = Uri.parse('https://api.quran.gading.dev/surah/$id');
//       var res = await http.get(url);

//       if (res.statusCode == 200) {
//         Map<String, dynamic> data =
//             (json.decode(res.body) as Map<String, dynamic>)["data"];

//         DetailSurah detailSurah = DetailSurah.fromJson(data);

//         print('Number: ${detailSurah.number}');
//         print('Sequence: ${detailSurah.sequence}');
//         print('Number of Verses: ${detailSurah.numberOfVerses}');
//         print('Name Short: ${detailSurah.name?.short}');
//         print('Name Long: ${detailSurah.name?.long}');
//         print('Revelation Arab: ${detailSurah.revelation?.arab}');
//         print('Revelation English: ${detailSurah.revelation?.en}');
//         print('Revelation ID: ${detailSurah.revelation?.id}');
//         print('Tafsir ID: ${detailSurah.tafsir?.id}');
//         print('Pre Bismillah Text: ${detailSurah.preBismillah?.text.arab}');
//         print(
//             'Pre Bismillah Translation: ${detailSurah.preBismillah?.translation.id}');
//         print(
//             'Pre Bismillah Audio Primary: ${detailSurah.preBismillah?.audio.primary}');
//         print('Verses:');
//         detailSurah.verses?.forEach((verse) {
//           print('  Verse Number in Quran: ${verse.number?.inQuran}');
//           print('  Verse Number in Surah: ${verse.number?.inSurah}');
//           print('  Meta Juz: ${verse.meta?.juz}');
//           print('  Meta Page: ${verse.meta?.page}');
//           print('  Meta Manzil: ${verse.meta?.manzil}');
//           print('  Meta Ruku: ${verse.meta?.ruku}');
//           print('  Meta Hizb Quarter: ${verse.meta?.hizbQuarter}');
//           print('  Meta Sajda Recommended: ${verse.meta?.sajda?.recommended}');
//           print('  Meta Sajda Obligatory: ${verse.meta?.sajda?.obligatory}');
//           print('  Text Arab: ${verse.text?.arab}');
//           print('  Text Transliteration: ${verse.text?.transliteration?.en}');
//           print('  Translation English: ${verse.translation?.en}');
//           print('  Translation ID: ${verse.translation?.id}');
//           print('  Audio Primary: ${verse.audio?.primary}');
//           print('  Audio Secondary: ${verse.audio?.secondary}');
//           print('  Tafsir ID: ${verse.tafsir?.id?.short}');
//           print('  Tafsir Long: ${verse.tafsir?.id?.long}');
//           print('');
//         });
//       } else {
//         print('Failed to load data: ${res.statusCode}');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }

//   await printDetailSurah(1.toString());

  // Uri url = Uri.parse('https://api.quran.gading.dev/surah');
  // var res = await http.get(url);

  // List data = (json.decode(res.body) as Map<String, dynamic>)["data"];

  // 1 - 114 -> index ke 113 = anas
  // print(data[113]['number']);

  //data dari API ( raw data ) -> Model ( yg sudah disimpan )
  // Surah surahAnnas = Surah.fromJson(data[113]);

  // print(surahAnnas.toJson());

  // Uri urlAnnas =
  //     Uri.parse('https://api.quran.gading.dev/surah/${surahAnnas.number}');
  // var resAnnas = await http.get(urlAnnas);

  // Map<String, dynamic> dataAnnas =
  //     (jsonDecode(resAnnas.body) as Map<String, dynamic>)['data'];

  //data dari api ( raw data ) -> model (yang sudah disiapin)
  // DetailSurah annas = DetailSurah.fromJson(dataAnnas);

  // print(annas.verses![0].text.arab);

  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const alquran_kareem());
  // });
}
