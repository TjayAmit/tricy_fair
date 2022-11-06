import 'dart:async';

import 'package:faircomputation/packages.dart';

class DashboardController extends GetxController {
  MapControllers? controllers;
  RxBool isInitialize = false.obs;

  @override
  void onInit() {
    super.onInit();
    controllers = Get.put(MapControllers());
    Timer(const Duration(seconds: 1000), () => isInitialize.toggle());
  }
}
