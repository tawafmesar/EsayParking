import 'package:esaypark/controller/add_vehicle_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../core/class/handlingdataview.dart';
import '../../core/constant/color.dart';
import '../../core/functions/alertexitapp.dart';
import '../../core/functions/validinput.dart';
import '../widget/auth/LogoAuth.dart';
import '../widget/auth/custombuttonauth.dart';
import '../widget/auth/customtextbodyauth.dart';
import '../widget/auth/customtextformauth.dart';
import '../widget/auth/customtexttitleauth.dart';
class AddVehicleScreen extends StatelessWidget {
  const AddVehicleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddVehicleControllerImp());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Add Vehicle'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // Handle back button press
        ),
      ),
      body:
         GetBuilder<AddVehicleControllerImp>(
            builder:
                (controller) =>
                HandlingDataViewRequest(statusRequest: controller.statusRequest,
                    widget:
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      child: Form(
                        key: controller.formstate,
                        child: ListView(children: [
                          const SizedBox(height: 20),
                          const LogoAuth(),
                          const SizedBox(height: 20),

                          const CustomTextBodyAuth(
                              text:
                              "To Use This App You Must Have An Acoount"),
                          const SizedBox(height: 15),

                          CustonTextFormAuth(
                            isNumber: false,
                            valid: (val) {
                              return validInput(val!, 3, 20, "plate_number");
                            },
                            mycontroller: controller.plate_number,
                            hinttext: "Enter vehicle plate",
                            iconData: Icons.person_outline,
                            labeltext: "Plate",

                            // mycontroller: ,
                          ),

                          CustonTextFormAuth(
                            isNumber: false,
                            valid: (val) {
                              return validInput(val!, 3, 35, "vehicle_desc");
                            },
                            mycontroller: controller.vehicle_desc,
                            hinttext: "Enter vehicle description",
                            iconData: Icons.email_outlined,
                            labeltext: "Description",
                            // mycontroller: ,
                          ),

                          CustonTextFormAuth(
                            isNumber: true,

                            valid: (val) {
                              return validInput(val!, 2, 19, "vehicle_type");
                            },
                            mycontroller: controller.vehicle_type,
                            hinttext: "  vehicle_type  ",
                            iconData: Icons.phone_android_outlined,
                            labeltext: "vehicle type ",
                            // mycontroller: ,
                          ),


                          CustomButtomAuth(text: "Add", onPressed: () {
                            controller.AddVehicle();
                          }),

                        ]),
                      ),
                    )
                )),
    );
  }
}
