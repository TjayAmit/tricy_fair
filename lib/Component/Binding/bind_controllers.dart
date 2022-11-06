import 'package:faircomputation/packages.dart';

class BindControllers extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapControllers>(() => MapControllers());
  }
}
