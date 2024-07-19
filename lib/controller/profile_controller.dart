import 'package:esaypark/core/constant/routes.dart';
import 'package:esaypark/data/models/parkinglot_model.dart';
import 'package:esaypark/data/models/reservation_model.dart';
import 'package:esaypark/data/models/vehicle_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/parkinglot.dart';
import '../core/functions/handingdatacontroller.dart';

import '../core/services/services.dart';
import '../data/datasource/remote/parkinglot_data.dart';
import '../data/datasource/remote/reservation_data.dart';
import '../data/datasource/remote/vehicles_data.dart';
import '../linkapi.dart';

abstract class ProfileController extends GetxController {

}

class ProfileControllerImp extends ProfileController {

  MyServices myServices = Get.find();

  String? users_id;
  String? vehicleIds;
  String? users_name;

  String allReservationCount = '0';
  String allvehivlesCount = '0';


  StatusRequest statusRequest = StatusRequest.none;

  ParkingLotData parkingLotData = ParkingLotData(Get.find());
  ReservationData reservationData = ReservationData(Get.find());


  List reservationvehicle = [];

  late TextEditingController vehicle_id;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  List<String> vehiclesdata = [];

  Map<String, String> vehivleseMap = {};
  VehiclesData vehiclesData = VehiclesData(Get.find());



  @override
  void onInit() {
    users_id = myServices.sharedPreferences.getString("id") ;
    users_name = myServices.sharedPreferences.getString("username") ;

    vehicleIds = myServices.sharedPreferences.getString("vehicleIds") ;
    vehicle_id = TextEditingController();

    getVehiclesdata();
    getReservationdata();
    super.onInit();

    // print("placesid ...................................");
    // print(placesid);

    updatedata();



  }


  updatedata(){
    updateshaerd( 'allReservationCount' ,  '');
    update();

  }

  @override
  void dispose() {
    vehicle_id.dispose();

    super.dispose();
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
          _navigateToback2Screen();
          update();
        } else {
          //          Get.defaultDialog(title: "Error", middleText: " ");

          _navigateTobackScreen('Error','This vehicle have previous  reservation ');
          //statusRequest = StatusRequest.failure;
          update();

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



        int vehivleCount = 0;





        List<dynamic> responsedata = response['data'];
        for (var item in responsedata) {
          vehivleCount++;

          String vehicleId = item['vehicle_id'];
          String vehicleName = item['plate_number'];
          vehiclesdata.add(vehicleName);
          vehivleseMap[vehicleName] = vehicleId; // Map college_name_en to college_id
        }

        allvehivlesCount = vehivleCount.toString();

        print("vehiclesdata......................................");
        print(vehiclesdata);

        print("allvehivlesCount......................................");
        print(allvehivlesCount);
        
        print("vehivleseMap......................................");
        print(vehivleseMap);

      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  @override
  getReservationdata() async {
    reservationvehicle.clear();
    allReservationCount='';
    updateshaerd(allReservationCount , '0');
    statusRequest = StatusRequest.loading;
    var response = await reservationData.getdata(users_id!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

        reservationvehicle.addAll(response['data'].map((e) => reservation_model.fromJson(e)).toList());
        print(reservationvehicle);

        int status1Count = 0;
        int status2Count = 0;

        int ReservationCount = 0;

        for (var reservation in reservationvehicle) {
          ReservationCount++;
          if (reservation.reservationStatus == '0') { // Compare with strings
            status1Count++;
          } else if (reservation.reservationStatus == '1') { // Compare with strings
            status2Count++;
          }
        }

        allReservationCount = ReservationCount.toString();
        updateshaerd(allReservationCount , allReservationCount);

        print('Count of reservationStatus = 0: $status1Count');
        print('Count of reservationStatus = 1: $status2Count');





        print('allReservationCount: $allReservationCount');

        //print(vehicleIdsJson);

      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  remove(String id) async {
    //  data.clear();
    print("=============================== id $id ");
    print(id);

    statusRequest = StatusRequest.loading;
    var response = await reservationData.removeReservationData(id);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {


        _navigateTobackScreen('Success', 'Your reservation has been delete successfully');
        getReservationdata();
        update();

        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();

  }



  Future<void> _navigateTobackScreen(String title, String middletext ) async {
    Get.defaultDialog(
      title: title,
      middleText: middletext ,
    );

    await Future.delayed(Duration(seconds: 3));

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

  updateshaerd(String Kay , String Value){
    myServices.sharedPreferences
        .setString(Kay, Value);

  }

  @override
  logout() async {

    myServices.sharedPreferences.setString("step","1") ;

    await Future.delayed(Duration.zero); // Add this line to schedule the navigation in the next frame
    Get.offNamed(AppRoute.login);
  }

}