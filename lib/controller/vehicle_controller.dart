import 'dart:convert';

import 'package:esaypark/core/constant/routes.dart';
import 'package:esaypark/data/models/vehicle_model.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handingdatacontroller.dart';

import '../core/services/services.dart';
import '../data/datasource/remote/vehicles_data.dart';
import '../linkapi.dart';

abstract class VehiclesController extends GetxController {

}

class VehiclesControllerImp extends VehiclesController {

  MyServices myServices = Get.find();

  String? users_id;
  StatusRequest statusRequest = StatusRequest.none;

  VehiclesData vehiclesData = VehiclesData(Get.find());


  List vehicles = [];





  @override
  void onInit() {
    users_id = myServices.sharedPreferences.getString("id") ;
    getVehiclesdata();
    super.onInit();

    // print("placesid ...................................");
    // print(placesid);
  }



  @override
  getVehiclesdata() async {
    vehicles.clear();

    statusRequest = StatusRequest.loading;
    var response = await vehiclesData.getdata(users_id!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {

        List<vehicle_model> vehicleModels = [];
        for (var item in response['data']) {
          if (item is Map<String, dynamic>) {
            vehicleModels.add(vehicle_model.fromJson(item));
          }
        }
        vehicles.addAll(vehicleModels);

        // Extracting only vehicleId from vehicleModels where vehicleStatus is 1
        List<String?> vehicleIds = vehicleModels
            .where((model) => model.vehicleStatus == "1")
            .map((model) => model.vehicleId)
            .toList();
        print(vehicleIds);

// Convert the list of vehicleIds to JSON and then store it
        List<int> intVehicleIds = vehicleIds.map((id) => int.parse(id!)).toList();
        String vehicleIdsJson = jsonEncode(intVehicleIds[0]);
        myServices.sharedPreferences.setString("vehicleIds", vehicleIdsJson);

        print(vehicleIdsJson);

      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  gotoaddvehicle(){

      Get.toNamed(AppRoute.addvehicleScreen);

  }


  buttumupdate()  {
    getVehiclesdata();
    update();
  }


}