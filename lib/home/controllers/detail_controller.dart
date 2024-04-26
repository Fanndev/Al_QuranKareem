import 'package:alquran_kareem/data/model/detail_surah.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';

class DetailController extends GetxController {
  RxString kondisiAudio = 'stop'.obs;
  final player = AudioPlayer();
  RxBool isDarkMode = false.obs;

  Future<DetailSurah> getDetailSurah(String id) async {
    Uri url = Uri.parse('https://api.quran.gading.dev/surah/$id');
    var res = await http.get(url);

    Map<String, dynamic> data =
        (json.decode(res.body) as Map<String, dynamic>)["data"];

    return DetailSurah.fromJson(data);
  }

  void stopAudio() async {
    try {
      await player.stop();
      kondisiAudio.value = 'stop';
    } on PlayerException catch (e) {
      Get.defaultDialog(
          title: 'Terjadi kesalahan', middleText: e.message.toString());
    } on PlayerInterruptedException catch (e) {
      Get.defaultDialog(
          title: 'Terjadi kesalahan',
          middleText: 'Connection aborted: ${e.message}');
    } catch (e) {
      Get.defaultDialog(
          title: 'Terjadi kesalahan', middleText: 'Tidak dapat stop audio');
    }
  }

  void resumeAudio() async {
    try {
      kondisiAudio.value = 'playing';
      await player.play();
      kondisiAudio.value = 'stop';
    } on PlayerException catch (e) {
      Get.defaultDialog(
          title: 'Terjadi kesalahan', middleText: e.message.toString());
    } on PlayerInterruptedException catch (e) {
      Get.defaultDialog(
          title: 'Terjadi kesalahan',
          middleText: 'Connection aborted: ${e.message}');
    } catch (e) {
      Get.defaultDialog(
          title: 'Terjadi kesalahan', middleText: 'Tidak dapat resume audio');
    }
  }

  void pauseAudio() async {
    try {
      print('Kondisi 1 : ${kondisiAudio}');
      await player.pause();
      kondisiAudio.value = 'pause';
      print('Kondisi 2 : ${kondisiAudio}');
    } on PlayerException catch (e) {
      Get.defaultDialog(
          title: 'Terjadi kesalahan', middleText: e.message.toString());
    } on PlayerInterruptedException catch (e) {
      Get.defaultDialog(
          title: 'Terjadi kesalahan',
          middleText: 'Connection aborted: ${e.message}');
    } catch (e) {
      Get.defaultDialog(
          title: 'Terjadi kesalahan', middleText: 'Tidak dapat pause audio');
    }
  }

  void playAudio(String? url) async {
    if (url != null) {
      //proses
      try {
        final player = AudioPlayer();
        await player.stop();
        await player.setUrl(url);
        kondisiAudio.value = 'playing';
        await player.play();
        kondisiAudio.value = 'stop';
        await player.stop();
        print(kondisiAudio);
      } on PlayerException catch (e) {
        Get.defaultDialog(
            title: 'Terjadi kesalahan', middleText: e.message.toString());
      } on PlayerInterruptedException catch (e) {
        Get.defaultDialog(
            title: 'Terjadi kesalahan',
            middleText: 'Connection aborted: ${e.message}');
      } catch (e) {
        Get.defaultDialog(
            title: 'Terjadi kesalahan',
            middleText: 'Tidak dapat memutar audio');
      }
    } else {
      Get.defaultDialog(
          title: 'Terjadi kesalahan',
          middleText: 'URL audio tidak dapat diakses / tidak ada');
    }
    @override
    void onClose() {
      player.stop();
      player.dispose();
      super.onClose();
    }
  }
}
