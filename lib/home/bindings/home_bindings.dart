import 'package:get/get.dart';
import 'package:alquran_kareem/home/controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
