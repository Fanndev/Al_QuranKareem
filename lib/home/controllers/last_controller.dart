import 'package:alquran_kareem/data/model/ayat.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LastController extends GetxController {
  Future<Ayat> getDetailSurah(String id) async {
    Uri url = Uri.parse('https://api.quran.gading.dev/surah/$id/$id');
    var res = await http.get(url);

    Map<String, dynamic> data =
        (json.decode(res.body) as Map<String, dynamic>)["data"];

    return Ayat.fromJson(data);
  }
}
