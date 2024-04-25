import 'package:alquran_kareem/home/controllers/detailjuz_controller.dart';
import 'package:get/get.dart';

class DetailJuzBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DetailJuzController());
  }
}
