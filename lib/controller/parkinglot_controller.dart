import 'package:esaypark/core/constant/routes.dart';
import 'package:esaypark/data/models/parkinglot_model.dart';
import 'package:esaypark/data/models/vehicle_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/parkinglot.dart';
import '../core/functions/handingdatacontroller.dart';

import '../core/services/services.dart';
import '../data/datasource/remote/parkinglot_data.dart';
import '../data/datasource/remote/vehicles_data.dart';
import '../linkapi.dart';

abstract class ParkingLotController extends GetxController {

}

class ParkingLotControllerImp extends ParkingLotController {

  MyServices myServices = Get.find();

  String? users_id;
  String? vehicleIds;


  StatusRequest statusRequest = StatusRequest.none;

  ParkingLotData parkingLotData = ParkingLotData(Get.find());


  // List parkinglot = [];

  late TextEditingController vehicle_id;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  List<String> vehiclesdata = [];

  Map<String, String> vehivleseMap = {};
  VehiclesData vehiclesData = VehiclesData(Get.find());



  @override
  void onInit() {
    users_id = myServices.sharedPreferences.getString("id") ;
    vehicleIds = myServices.sharedPreferences.getString("vehicleIds") ;
    vehicle_id = TextEditingController();

    getVehiclesdata();
    getparkinglot();
    super.onInit();

    // print("placesid ...................................");
    // print(placesid);
  }

  @override
  void dispose() {
    vehicle_id.dispose();

    super.dispose();
  }


  @override
  getparkinglot() async {
    parkinglot.clear();
    statusRequest = StatusRequest.loading;
    var response = await parkingLotData.getdata();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

        // Assuming the response contains a list of parking lot data
        List<dynamic> responseData = response['data']; // Adjust this according to your actual response structure
        for (var item in responseData) {
          parkinglot.add({
            'id': item['parkinglot_id'].toString(), // Assuming 'id' is a string in your original data
            'name': item['parkinglot_name'].toString(),
            'items': item['parkinglot_dept'].toString(),
            'image': 'http://easyparkingjazan.mooo.com/upload/${item['parkinglot_img']}',
            'latitude': item['latitude'].toString(),
            'longitude': item['longitude'].toString(),
          });
        }


      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  gotoaddvehicle(){

    Get.toNamed(AppRoute.addvehicleScreen);

  }


  @override
  addreservation(String parkingid) async {
    if (vehicleIds != null) {
      print("=============================== parkingid  ");

      print(parkingid);
      print("=============================== vehicleIds  ");
      print(vehicleIds);

      print(vehicleIds.runtimeType);
      statusRequest = StatusRequest.loading;


      update();
      var response = await parkingLotData.addreservationdata(vehicle_id.text, parkingid);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          getparkinglot();
          _navigateToback2Screen();
          update();
        } else {
          Get.defaultDialog(title: "Error", middleText: " ");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("Error: vehicleIds is null");
    }
  }



  @override
  getVehiclesdata() async {
    vehiclesdata.clear();
    statusRequest = StatusRequest.loading;
    var response = await vehiclesData.getdata(users_id!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {




        List<dynamic> responsedata = response['data'];
        for (var item in responsedata) {
          String vehicle_id = item['vehicle_id'];
          String vehicle_name = item['plate_number'];
          vehiclesdata.add(vehicle_name);
          vehivleseMap[vehicle_name] = vehicle_id; // Map college_name_en to college_id
        }
        print("vehiclesdata......................................");
        print(vehiclesdata);

        print("vehivleseMap......................................");
        print(vehivleseMap);

      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }



  Future<void> _navigateTobackScreen() async {
    Get.defaultDialog(
      title: "Success",
      middleText: "The reservation was added successfully",
    );

    await Future.delayed(Duration(seconds: 2));

    Get.back();

  }
  Future<void> _navigateToback2Screen() async {
    Get.defaultDialog(
      title: "Success",
      middleText: "The reservation was added successfully",
    );

    await Future.delayed(Duration(seconds: 2));

    Get.back();
    Get.back();

  }



}