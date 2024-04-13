import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../../controller/parkingpolice_controller.dart';
import '../../controller/profile_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/color.dart';
import '../widget/listcardReservation.dart';
import '../widget/listcardallReservation.dart';
import '../widget/test.dart';

class ParkingPoliceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(ParkingPoliceControllerImp());
    final contrllerr = Get.put(ParkingPoliceControllerImp());

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        Scaffold(
          appBar: AppBar(
            actions: [
              InkWell(
                  onTap: () {
                    contrllerr.updatescreen();

                  },
                  child:
                      Icon(Icons.update, size: 45.0, color: AppColor.whitee)),
              SizedBox(width: 15,),
              InkWell(
                  onTap: () {
                    contrllerr.logout();

                  },
                  child:
                  Icon(Icons.logout, size: 45.0, color:Colors.red)
              ),
            ],
            backgroundColor: AppColor.secoundColor2,
            elevation: 10.0,
            title: Text('Parking Police',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: AppColor.whitee)),
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 43),
              child: Column(
                children: [
                  const Text(
                    'The current reservations',
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontSize: 27,
                    ),
                  ),
                  const Divider(
                    thickness: 2.5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: GetBuilder<ParkingPoliceControllerImp>(
                        builder: ((controller) => HandlingDataView(
                            statusRequest: controller.statusRequest,
                            widget: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.reservationvehicle.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 2.6,
                                crossAxisCount: 1,
                                mainAxisSpacing: 10.0,
                                crossAxisSpacing: 5.0,
                              ),
                              itemBuilder: (context, index) {
                                return ListCardAllReservation(
                                    controller.reservationvehicle[index]);
                              },
                            )))),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
