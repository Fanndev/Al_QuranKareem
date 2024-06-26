import 'package:alquran_kareem/data/model/detail_surah.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DetailController extends GetxController {
  Future<DetailSurah> getDetailSurah(String id) async {
    Uri url = Uri.parse('https://api.quran.gading.dev/surah/$id');
    var res = await http.get(url);

    Map<String,dynamic> data = (json.decode(res.body) as Map<String, dynamic>)["data"];
    // print(data);

    return DetailSurah.fromJson(data);
  }
}