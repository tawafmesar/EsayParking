import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../controller/vehicle_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/color.dart';
import '../../linkapi.dart';
import '../widget/cardbutton.dart';

class VehicleScreen extends StatelessWidget {
  const VehicleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VehiclesControllerImp());
    final controller = Get.put(VehiclesControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vehicles Table'),
          actions: [
            IconButton(
              onPressed: () async {
                controller.buttumupdate();
              },
              icon: const FaIcon(FontAwesomeIcons.arrowsRotate),
            ),
          ]
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CupertinoTextField(
                    prefix: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Icon(Icons.search),
                    ),
                    padding: EdgeInsets.all(15),
                    placeholder: 'Search Vehicles name',
                    style: TextStyle(color: Colors.white),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  const SizedBox(height: 5),

                  GetBuilder<VehiclesControllerImp>(builder: ((controller) => HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget:SizedBox(
                          height: MediaQuery.of(context).size.height - // adjust the height as per your requirements
                              AppBar().preferredSize.height -     // subtract app bar height
                              MediaQuery.of(context).padding.top - // subtract top padding
                              MediaQuery.of(context).padding.bottom,
                          child:  ListView(
                            physics: const ScrollPhysics(),

                            children: [

                          ...List.generate(
                              controller.vehicles.length,
                                  (index) =>     Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15)),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CachedNetworkImage(
                                          height: 175,
                                          width: 140,
                                          fit: BoxFit.cover,
                                          imageUrl: AppLink.car,
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 175,
                                            padding: const EdgeInsets.all(15),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${controller.vehicles[index].plateNumber}",
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 16),
                                                ),
                                                Text('items'),
                                                const Spacer(),
                                                const Text('Waiting time: 2hrs'),
                                                Text(
                                                  'Closes at 10PM',
                                                  style:
                                                  TextStyle(color: Colors.redAccent[100]),
                                                ),
                                                Row(
                                                  children: const [
                                                    cardButtons(iconData: Icons.call, label: 'Call',),
                                                    cardButtons(iconData: Icons.location_on, label: 'Map',),

                                                     Spacer(),
                                                    Text(
                                                        'jjjj'),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                          ),
                              SizedBox(height: 100,)
                        ],
                      ))
                  )
                  )),
                ],
              ),
            ),
          )), floatingActionButton: FloatingActionButton(
              onPressed: () {
                controller.gotoaddvehicle();                },
      child: const Icon(Icons.add_card),
    )
    );
  }
}
