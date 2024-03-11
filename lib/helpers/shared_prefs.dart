import 'dart:convert';

import 'package:get/get.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import '../core/services/services.dart';

MyServices myServices = Get.find();

LatLng getLatLngFromSharedPrefs() {
  return LatLng(myServices.sharedPreferences.getDouble('latitude')!,
      myServices.sharedPreferences.getDouble('longitude')!);
}

Map getDecodedResponseFromSharedPrefs(int index) {
  String key = 'restaurant--$index';
  Map response = json.decode(myServices.sharedPreferences.getString(key)!);
  return response;
}

num getDistanceFromSharedPrefs(int index) {
  num distance = getDecodedResponseFromSharedPrefs(index)['distance'];
  return distance;
}

num getDurationFromSharedPrefs(int index) {
  num duration = getDecodedResponseFromSharedPrefs(index)['duration'];
  return duration;
}

Map getGeometryFromSharedPrefs(int index) {
  Map geometry = getDecodedResponseFromSharedPrefs(index)['geometry'];
  return geometry;
}
