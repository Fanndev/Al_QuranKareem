import 'package:alquran_kareem/data/model/juz.dart';
import 'package:alquran_kareem/data/model/surah.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  List<Surah> allSurah = [];
  RxBool isDarkMode =
      false.obs; // Gunakan observable untuk memperbarui tampilan
  Future<List<Surah>> getAllSurah() async {
    Uri url = Uri.parse('https://api.quran.gading.dev/surah');
    var res = await http.get(url);

    List? data = (json.decode(res.body) as Map<String, dynamic>)["data"];

    if (data == null || data.isEmpty) {
      return [];
    } else {
      allSurah = data.map((e) => Surah.fromJson(e)).toList();
      return allSurah;
    }
  }

  Future<List<Juz>> getAllJuz() async {
    List<Juz> allJuz = [];
    for (int i = 1; i <= 30; i++) {
      try {
        Uri url = Uri.parse('https://api.quran.gading.dev/juz/$i');
        var res = await http.get(url);

        if (res.statusCode == 200) {
          Map<String, dynamic> data =
              (json.decode(res.body) as Map<String, dynamic>)["data"];

          Juz juz = Juz.fromJson(data);
          allJuz.add(juz);
        } else {
          // Handle jika respons tidak berhasil
          print('Gagal mengambil data Juz $i: ${res.statusCode}');
        }
      } catch (e) {
        // Handle jika terjadi kesalahan saat mengambil data
        print('Error saat mengambil data Juz $i: $e');
      }
    }
    return allJuz;
  }
}
