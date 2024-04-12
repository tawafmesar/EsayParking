

import 'package:esaypark/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/homescreen_controller.dart';
import '../../../core/constant/color.dart';
import '../../data/models/reservation_model.dart';

class ListCardReservation extends GetView<ProfileControllerImp> {
  final reservation_model reservationmodel;
  // final bool active;
  const ListCardReservation(this.reservationmodel, {Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileControllerImp());

    return  Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Adjust vertical margin for spacing
      elevation: 4, // Add a shadow to the card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), // Add rounded corners
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: GradientTemplate.gradientTemplate[4].colors, // Choose a gradient from your template
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          boxShadow: [
            BoxShadow(
              color: GradientTemplate.gradientTemplate[4].colors.last.withOpacity(0.4),
              blurRadius: 8,
              spreadRadius: 2,
              offset: Offset(4, 4),
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(16)), // Apply the same radius as the shape
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Adjust padding for content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(

                reservationmodel.plateNumber!,
                style: TextStyle(
                  color: AppColor.primaryTextColor, // Use the alarm-style text color
                  fontSize: 25, // Increase the font size for the title
                  fontWeight: FontWeight.w700, // Apply a bold font weight
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    reservationmodel.reservationDate!,

                    style: TextStyle(
                      color: AppColor.primaryColor, // Use a similar color
                      fontSize: 20,
                      fontWeight: FontWeight.bold, // Apply a bold font weight
                    ),

                  ),
                  IconButton(
                    onPressed: () {
                     // controller.reservationmodel(reservationId.alarmId!) ;
                    },
                    icon: Icon(
                      Icons.delete_forever,
                      size: 45.0,
                      color: AppColor.backgroundcolor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


