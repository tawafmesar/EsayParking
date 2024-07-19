import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../data/datasource/remote/auth/signup.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/vehicles_data.dart';

abstract class AddVehicleController extends GetxController {
  AddVehicle();
}


class AddVehicleControllerImp extends AddVehicleController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController plate_number;
  late TextEditingController vehicle_desc;
  late TextEditingController vehicle_type;

  MyServices myServices = Get.find();

  String? users_id;


  StatusRequest statusRequest = StatusRequest.none;

  VehiclesData vehiclesData = VehiclesData(Get.find());

  List data = [];


  @override
  AddVehicle() async {
    print('plate_number.............. $plate_number');
    print('plate_number.............. $vehicle_desc');

    print('plate_number.............. $vehicle_type');
    print('plate_number.............. $users_id');

    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update() ;
      var response = await vehiclesData.postdata(
          plate_number.text, vehicle_desc.text, vehicle_type.text, users_id!);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          _navigateTobackScreen();

        } else {
          Get.defaultDialog(title: "Success" , middleText: "يرجى التأكد , البريد الألكتروني او رقم الهاتف موجود مسبقاً") ;
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {

    }
  }

  Future<void> _navigateTobackScreen() async {
    Get.defaultDialog(
      title: "Success",
      middleText: "The Vehicle was added successfully",
    );

    await Future.delayed(Duration(seconds: 2));

    Get.back();
    Get.back();

  }



  @override
  void onInit() {
    plate_number = TextEditingController() ;
    vehicle_desc = TextEditingController();
    vehicle_type = TextEditingController();
    users_id = myServices.sharedPreferences.getString("id") ;

    super.onInit();
  }

  @override
  void dispose() {
    plate_number.dispose();
    vehicle_desc.dispose();
    vehicle_type.dispose();
    super.dispose();
  }
}