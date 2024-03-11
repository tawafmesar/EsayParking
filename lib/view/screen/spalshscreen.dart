import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:esaypark/core/constant/color.dart';

import '../../core/constant/imageasset.dart';
import '../../core/constant/parkinglot.dart';
import '../../core/constant/routes.dart';
import '../../core/localization/changelocal.dart';
import '../../core/services/services.dart';
import '../../helpers/directions_handler.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initializeLocationAndSave();


  }

  void initializeLocationAndSave() async {
    // Ensure all permissions are collected for Locations
    Location _location = Location();
    bool? _serviceEnabled;
    PermissionStatus? _permissionGranted;
    MyServices myServices = Get.find();

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
    }

    // Get capture the current user location
    LocationData _locationData = await _location.getLocation();
    // LatLng currentLatLng =
    // LatLng(_locationData.latitude!, _locationData.longitude!);

    LatLng currentLatLng = LatLng(16.980011, 42.617043);

    print('test currentLatLng/////////////////////////////////////////');

    print(currentLatLng);

    // Store the user location in sharedPreferences
    myServices.sharedPreferences.setDouble('latitude', _locationData.latitude!);
    myServices.sharedPreferences.setDouble('longitude', _locationData.longitude!);

    // Get and store the directions API response in sharedPreferences
    for (int i = 0; i < parkinglot.length; i++) {
      Map modifiedResponse = await getDirectionsAPIResponse(currentLatLng, i);
      saveDirectionsAPIResponse(i, json.encode(modifiedResponse));
    }

    Future.delayed(const Duration(milliseconds: 4400), () {
      Get.find<LocaleController>().changeLang("en");
      Get.offNamed("/");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryTextColor,
      body: Center(
        child: Image.asset(
          AppImageAsset.splash,
        ),
      ),
    );
  }
}

