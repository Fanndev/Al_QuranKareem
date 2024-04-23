import 'package:alquran_kareem/home/controllers/ayat_controller.dart';
import 'package:get/get.dart';

class AyatBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AyatController);
  }
}
