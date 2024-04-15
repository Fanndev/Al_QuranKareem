import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alquran_kareem/home/controllers/detail_controller.dart';

class DetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DetailController());
  }
}
