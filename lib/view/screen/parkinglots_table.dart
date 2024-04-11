import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../controller/parkinglot_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/color.dart';
import '../../core/constant/parkinglot.dart';
import '../../helpers/shared_prefs.dart';
import '../widget/auth/custombuttonauth.dart';
import '../widget/cardbutton.dart';

class ParkinglotsTable extends StatefulWidget {
  const ParkinglotsTable({Key? key}) : super(key: key);

  @override
  State<ParkinglotsTable> createState() => _ParkinglotsTableState();
}


void _showBottomSheet(BuildContext context , String parkigid) {
  String? selectedOption;
  String? parkig_id = parkigid;

  showModalBottomSheet(
    context: context,
    elevation: 10,

    shape: const RoundedRectangleBorder(
      side: BorderSide(
        color: AppColor.primaryColor,
        width: 3.0,
      ),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(35),
        topRight: Radius.circular(35),
      ),
    ),
    builder: (_) {
      return Container(
        height: 300, // Adjust this value to your desired height

        child: GetBuilder<ParkingLotControllerImp>(
          builder: (controller) => HandlingDataViewRequest(
            statusRequest: controller.statusRequest,
            widget:  controller.activitreservation == true ?  Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Form(
                key: controller.formstate,
                child: ListView(
                  children: [
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Select the vehicle you want to reserve parking for',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.whitee,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black.withOpacity(0.5),
                              offset: Offset(5.0, 5.0),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: 20),

                    const SizedBox(height: 20),


                    DropdownButtonFormField<String>(
                      value: selectedOption, // Initially selected option (can be null).
                      decoration: InputDecoration(
                        hintText: 'Select the vehicle',
                        hintStyle: const TextStyle(fontSize: 14),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                        label: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 9),
                          child: Text('The Vehicle'),
                        ),
                        suffixIcon: InkWell(child: Icon(FontAwesomeIcons.car)),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),

                      onChanged: (String? newValue) {


                        print('change $newValue');
                        selectedOption = newValue;
                        if (newValue != null) {
                          controller.vehicle_id.text = controller.vehivleseMap[newValue] ?? ''; // Assign the selected college_id to controller.college_id

                        }

                      },
                      items: controller.vehiclesdata.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 20),

                    CustomButtomAuth(text: "Save", onPressed: () {
                      //controller.addRes();
                      print(parkig_id);
                      controller.addreservation(parkig_id);
                    }),
                  ],
                ),
              ),
            ) : Container(
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Text(
                'Sorry, you cannot make more than two reservations at the same time',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColor.whitee,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black.withOpacity(0.5),
                      offset: Offset(5.0, 5.0),
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
            ),
              ),) ,
          ),
        ),
      );
    },
  );
}

class _ParkinglotsTableState extends State<ParkinglotsTable> {
  /// Add handlers to buttons later on
  /// For call and maps we can use url_launcher package.
  /// We can also create a turn-by-turn navigation for a particular restaurant.
  /// 🔥 Let's look at it in the next video!!



  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ParkingLotControllerImp());

    return Scaffold(
      appBar:
      AppBar(
      backgroundColor: AppColor.secoundColor2,
      elevation: 10.0,
      title: Text('Parking lots table',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: AppColor.whitee)),
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
                    placeholder: 'Search by name in parkinglot',
                    style: TextStyle(color: Colors.white),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  const SizedBox(height: 5),
                  GetBuilder<ParkingLotControllerImp>(builder: ((controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,   widget :
                    ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: parkinglot.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
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
                              imageUrl: parkinglot[index]['image'],
                            ),
                            Expanded(
                              child: Container(
                                height: 175,
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      parkinglot[index]['name'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    Text(parkinglot[index]['items']),
                                    const Spacer(),
                                    const Text('Waiting time: 2hrs'),
                                    Text(
                                      'the car our vehicle',
                                      style:
                                      TextStyle(color: Colors.redAccent[100]),
                                    ),
                                    Row(
                                      children: [
                                        cardButtons(iconData: Icons.car_rental,
                                          label: 'Book now',
                                        onPressed: () => _showBottomSheet(context,parkinglot[index]['id'])
                                          // onPressed:(
                                          //     ){
                                          //   // controller.addreservation(parkinglot[index]['id']);
                                          //
                                          // },
                              ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ) )
                  )
                  ),

                ],
              ),
            ),
          )),
    );
  }
}
