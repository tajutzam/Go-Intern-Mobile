import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  var lat = 0.0.obs;
  var long = 0.0.obs;
  var myPosition = Position(
          longitude: 0,
          latitude: 0,
          timestamp: DateTime.now(),
          accuracy: 0,
          altitude: 0,
          heading: 0,
          speed: 0,
          speedAccuracy: 0)
      .obs;

  var address = "".obs;

  Future<void> getLokasi() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Location service belum aktif");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location Permision Ditolak");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("Lokasi permision ditolak , gagal request permision");
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      List<Placemark> placeMark =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placeMark[0];
      myPosition.value = position;
      address.value = "${place.country} , ${place.administrativeArea}";
      print(address.value);
      update();
    } catch (e) {
      address.value = "terjadi kesalahan";
    }
  }
  
  @override
  void onInit() {
    super.onInit();
    getLokasi();
    ever(
      lat,
      (callback) {
        print('calback run');
        getLokasi();
      },
    );
  }
}
