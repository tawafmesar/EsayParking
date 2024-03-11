import 'package:get/get.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import '../core/constant/parkinglot.dart';
import '../core/services/services.dart';
import '../requests/mapbox_requests.dart';

MyServices myServices = Get.find();

Future<Map> getDirectionsAPIResponse(LatLng currentLatLng, int index) async {
  final response = await getCyclingRouteUsingMapbox(
      currentLatLng,
      LatLng(double.parse(parkinglot[index]['latitude']),
          double.parse(parkinglot[index]['longitude'])));
  Map geometry = response['routes'][0]['geometry'];
  num duration = response['routes'][0]['duration'];
  num distance = response['routes'][0]['distance'];
  print('-------------------${parkinglot[index]['name']}-------------------');
  print(distance);
  print(duration);

  Map modifiedResponse = {
    "geometry": geometry,
    "duration": duration,
    "distance": distance,
  };
  return modifiedResponse;

}

void saveDirectionsAPIResponse(int index, String response) {
  myServices.sharedPreferences.setString('restaurant--$index', response);
}
