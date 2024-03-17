import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/parkinglot_controller.dart';

class TestPAge extends StatelessWidget {
  const TestPAge({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ParkingLotControllerImp());

    return const Placeholder();
  }
}
