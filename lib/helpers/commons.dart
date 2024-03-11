import 'package:mapbox_gl/mapbox_gl.dart';

import '../core/constant/parkinglot.dart';


LatLng getLatLngFromRestaurantData(int index) {
  return LatLng(double.parse(parkinglot[index]['latitude']),
      double.parse(parkinglot[index]['longitude']));
}
