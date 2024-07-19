

import 'package:esaypark/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../controller/homescreen_controller.dart';
import '../../controller/parkingpolice_controller.dart';
import '../../core/constant/color.dart';
import '../../data/models/reservation_model.dart';

class ListCardAllReservation extends GetView<ParkingPoliceControllerImp> {
  final reservation_model reservationmodel;
  // final bool active;
  const ListCardAllReservation(this.reservationmodel, {Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ParkingPoliceControllerImp());


    final contrllerr = Get.put(ParkingPoliceControllerImp());

    return  Material(

      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Container(
            height: 45, // Set a fixed height or use MediaQuery to get the screen height
            decoration:const BoxDecoration(
                color: AppColor.backgroundcolor2,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(25))
            ),
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      height: 30,
                      child:const Center(
                        child: Icon(
                          FontAwesomeIcons.car,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),

                    Container(
                      height: 30,
                      child:  Center(
                        child: Text(
                          reservationmodel.plateNumber!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),

                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 30,
                      child:const Center(
                        child: Icon(
                          FontAwesomeIcons.user,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    )
                    ,  Container(
                      height: 32,
                      child:  Center(
                        child: Text(
                          reservationmodel.usersName!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),

                  ],
                )
                ,
              ],
            ),
          ),

          Container(
            color: Colors.grey[200], // Set a background color for better visualization
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: AppColor.backgroundcolor2,
                    child: Column(
                      children: [

                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              height: 40,
                              child:const Icon(
                                FontAwesomeIcons.calendarDay,
                                color: AppColor.primaryColor,
                              ),
                            ),
                            SizedBox(width: 10,),

                            Expanded(
                              child: Text(
                                reservationmodel.reservationDate!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  width: MediaQuery.of(context).size.width * 0.27, // Calculate 25% width
                  child: Center(
                    child: ElevatedButton(
                      style:ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(AppColor.primaryColor), // Set the background color here
                      ),
                      onPressed: () async {
                        print('testtt');
                        print(reservationmodel.reservationId!);
                        contrllerr.checkoutreservation(reservationmodel.reservationId!);
                      }, // Add function for button press
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Align the icon and text in the center horizontally
                        children: [
                          Text('CheckOut ☑'),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  width: MediaQuery.of(context).size.width * 0.15, // Calculate 25% width

                  child: Center(
                    child: ElevatedButton(
                      style:ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(AppColor.primaryColor), // Set the background color here
                      ),
                      onPressed: () async {
                        print('testtt');
                        print(reservationmodel.reservationId!);

                        contrllerr.remove(reservationmodel.reservationId!);
                      }, // Add function for button press
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Align the icon and text in the center horizontally
                        children: [
                          Icon(Icons.delete),
                          SizedBox(width: 2),
                        ],
                      ),
                    ),
                  ),
                )

              ],
            ),
          ),
          Container(
            height: 45, // Set a fixed height or use MediaQuery to get the screen height
            decoration:const BoxDecoration(
                color: AppColor.backgroundcolor2,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(25))
            ),
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      height: 30,
                      child:const Center(
                        child: Icon(
                          FontAwesomeIcons.squareParking,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),

                    Container(
                      height: 30,
                      child:  Center(
                        child: Text(
                          'Parkinglot : ${reservationmodel.parkinglotName!}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),

                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 30,
                      child:const Center(
                        child: Icon(
                          FontAwesomeIcons.folderTree,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    )
                    ,  Container(
                      height: 32,
                      child:  Center(
                        child: Text(
                          reservationmodel.parkinglotDept!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),

                  ],
                )
                ,
              ],
            ),
          ),
        ],
      ),
    );
  }
}


