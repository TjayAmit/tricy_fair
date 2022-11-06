import 'package:faircomputation/packages.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            Positioned.fill(
              child: Obx(
                () => controller.isInitialize.isTrue
                    ? SizedBox(
                        width: Get.width,
                        height: Get.height,
                        child: Obx(
                          () => GoogleMap(
                            compassEnabled: false,
                            zoomControlsEnabled: false,
                            mapToolbarEnabled: false,
                            mapType: MapType.normal,
                            initialCameraPosition:
                                controller.controllers!.initialGooglePlex,
                            markers: controller.controllers!.markers.value!,
                            polylines: controller.controllers!.polylines.value!,
                            myLocationEnabled: true,
                            myLocationButtonEnabled: false,
                            onMapCreated: (GoogleMapController gmapController) {
                              controller.controllers!.controller
                                  .complete(gmapController);
                            },
                          ),
                        ),
                      )
                    : loadingState(),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget loadingState() {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: const Center(child: Text('Loading')),
    );
  }
}
