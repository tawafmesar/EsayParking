import 'package:esaypark/core/constant/routes.dart';
import 'package:esaypark/data/models/parkinglot_model.dart';
import 'package:esaypark/data/models/vehicle_model.dart';
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





  @override
  void onInit() {
    users_id = myServices.sharedPreferences.getString("id") ;
    vehicleIds = myServices.sharedPreferences.getString("vehicleIds") ;

    getparkinglot();
    super.onInit();

    // print("placesid ...................................");
    // print(placesid);
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
      var response = await parkingLotData.addreservationdata(vehicleIds!, parkingid);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          getparkinglot();
          _navigateTobackScreen();
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




  Future<void> _navigateTobackScreen() async {
    Get.defaultDialog(
      title: "Success",
      middleText: "The reservation was added successfully",
    );

    await Future.delayed(Duration(seconds: 2));

    Get.back();

  }




}