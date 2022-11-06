import 'package:faircomputation/packages.dart';
import 'dart:async';
import 'package:location/location.dart' as loc;

class MapControllers extends GetxController {
  GoogleMapController? googleMapController;
  final Completer<GoogleMapController> controller = Completer();
  final TextEditingController destination = TextEditingController();
  final TextEditingController pickup = TextEditingController();
  final Rxn<Set<Marker>> markers = Rxn<Set<Marker>>({}).obs();
  final Rxn<Set<Polyline>> polylines = Rxn<Set<Polyline>>({}).obs();
  final isDestination = true.obs;
  loc.Location location = loc.Location();
  // Rxn<NewBooking> initialBooking = Rxn<NewBooking>(NewBooking()).obs();

  //Google maps
  final String googleApiKey = "AIzaSyCbS_RvBBvvV-Cp8yZ3vfZGDNfNaVenyMc";

  RxString exception = ''.obs;

  final LatLng defaultLocation = const LatLng(6.933128, 122.052439);
  LatLng? myLocation;

  LatLng? pickupLocation;
  LatLng? destinationLocation;

  Rxn<BitmapDescriptor>? pickupMarker = Rxn<BitmapDescriptor>(null).obs();
  Polyline? routePolyline;

  CameraPosition initialGooglePlex = const CameraPosition(
    target: LatLng(6.933128, 122.052439),
    zoom: 16.4746,
  );

  @override
  void onInit() async {
    super.onInit();
    currentLocation();
  }

  void currentLocation() async {
    try {
      loc.LocationData locationData = await location.getLocation();

      LatLng latLng = LatLng(locationData.latitude!, locationData.longitude!);

      CameraPosition cameraPosition = CameraPosition(
        target: latLng,
        zoom: 16.4746,
      );

      moveCameraCurrentPosition(cameraPosition);
      // if (initialBooking.value!.bookPickupMarker != null) {
      //   markers.value!.add(initialBooking.value!.bookPickupMarker!);
      //   markers.refresh();
      // }
    } catch (e) {
      exception.value = ' currentLocation module';
    }
  }

  void moveCameraCurrentPosition(CameraPosition position) {
    controller.future.then((gcontroller) =>
        gcontroller.animateCamera(CameraUpdate.newCameraPosition(
          position,
        )));
    initialGooglePlex = position;
  }
}
