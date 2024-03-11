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

        // Assuming response['data'] is a List of Map<String, dynamic>
        vehicles.addAll(response['data'].map((e) => vehicle_model.fromJson(e)).toList());
        print(vehicles);


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