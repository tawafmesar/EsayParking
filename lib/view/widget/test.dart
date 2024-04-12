

import 'package:esaypark/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../controller/homescreen_controller.dart';
import '../../../core/constant/color.dart';
import '../../data/models/reservation_model.dart';

class testListCardReservation extends GetView<ProfileControllerImp> {
  final reservation_model reservationmodel;
  // final bool active;
  const testListCardReservation(this.reservationmodel, {Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileControllerImp());


    final contrllerr = Get.put(ProfileControllerImp());

    return  Material(

      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Material(
            borderRadius:const BorderRadius.only(
                topLeft: Radius.circular(25)),
            color: AppColor.backgroundcolor2,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const Icon(
                      FontAwesomeIcons.car,
                      color: AppColor.primaryColor,
                    ),
                  SizedBox(width: 10,),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      'Vehicle Plate : ${reservationmodel.plateNumber!}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  )
                  ,
                ],
              ),
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
                                'Date : ${reservationmodel.reservationDate!}',
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
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: MediaQuery.of(context).size.width * 0.25, // Calculate 25% width
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
                          Icon(Icons.delete), // Add your icon here
                          SizedBox(width: 2), // Add some space between the icon and text
                          Text('Delete'), // Add your text here
                        ],
                      ),
                    ),
                  ),
                ),
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


