import 'dart:convert';
import 'package:alquran_kareem/data/model/surah.dart';
import 'package:alquran_kareem/data/model/detail_surah.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:alquran_kareem/main.dart';

void main() async {
  Uri url = Uri.parse('https://api.quran.gading.dev/surah');
  var res = await http.get(url);

  List data = (json.decode(res.body) as Map<String, dynamic>)["data"];

  // 1 - 114 -> index ke 113 = anas
  print(data[113]['number']);

  //data dari API ( raw data ) -> Model ( yg sudah disimpan )
  Surah surahAnnas = Surah.fromJson(data[113]);

  // print(surahAnnas.toJson());

  Uri urlAnnas =
      Uri.parse('https://api.quran.gading.dev/surah/${surahAnnas.number}');
  var resAnnas = await http.get(urlAnnas);

  Map<String, dynamic> dataAnnas =
      (jsonDecode(resAnnas.body) as Map<String, dynamic>)['data'];

  //data dari api ( raw data ) -> model (yang sudah disiapin)
  DetailSurah annas = DetailSurah.fromJson(dataAnnas);

  print(annas.verses![0].text.arab);

  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const alquran_kareem());
  // });
}
