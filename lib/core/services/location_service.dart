import 'package:location/location.dart';

class LocationService {
  Location location = Location();

  Future<LocationData?> requestLocationPermission() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    // التحقق إذا كانت خدمات الموقع مفعلة
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null; 
      }
    }

    // التحقق من حالة إذن الوصول للموقع
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null; // إذا لم يتم منح الإذن
      }
    }

    // الحصول على بيانات الموقع الحالي
    locationData = await location.getLocation();
    return locationData;
  }
}