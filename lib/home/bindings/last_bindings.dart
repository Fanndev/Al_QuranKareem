import 'package:alquran_kareem/home/controllers/ayat_controller.dart';
import 'package:alquran_kareem/home/controllers/last_controller.dart';
import 'package:get/get.dart';

class LastBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LastController);
  }
}
