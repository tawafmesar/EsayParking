import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../../controller/profile_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/color.dart';
import '../widget/listcardReservation.dart';
import '../widget/test.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileControllerImp());
    final controllerr =  Get.put(ProfileControllerImp());
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        Scaffold(
          appBar:
          AppBar(
            backgroundColor: AppColor.secoundColor2,
            elevation: 10.0,
            title: Text('Profile',
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

                  Container(
                    height: height * 0.40,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double innerHeight = constraints.maxHeight;
                        double innerWidth = constraints.maxWidth;
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            GetBuilder<ProfileControllerImp>(builder: ((controller) =>
                                Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: innerHeight * 0.65,
                                width: innerWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.black45,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 80,
                                    ),
                                    Text(
                                      controller.users_name ?? 'My Name',
                                      style: TextStyle(
                                        color: AppColor.primaryColor
                                        ,
                                        fontSize: 37,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'Reservation',
                                              style: TextStyle(
                                                color: Colors.grey[700],
                                                fontSize: 25,
                                              ),
                                            ),
                                            Text(
                                              controller.allReservationCount ?? '0',
                                              style: TextStyle(
                                                color: AppColor.primaryColor,
                                                fontSize: 25,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 25,
                                            vertical: 8,
                                          ),
                                          child: Container(
                                            height: 50,
                                            width: 3,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(100),
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              'Vehicle',
                                              style: TextStyle(
                                                color: Colors.grey[700],
                                                fontSize: 25,
                                              ),
                                            ),
                                            Text(
                                              controller.allvehivlesCount ?? '0',
                                              style: TextStyle(
                                                color: AppColor.primaryColor,
                                                fontSize: 25,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )

                            )
                            ),
                            Positioned(
                              top: 110,
                              right: 20,
                              child: InkWell(
                                onTap: (){

                                  controllerr.logout();
                                }, // Wrap everything in InkWell for tap detection
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                                  children:const [
                                    Icon(Icons.logout, size: 28.0,color:Colors.red ), // Customize icon size and color
                                    const SizedBox(height: 5.0), // Add spacing between icon and text
                                    Text('Logout', style:  TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:Colors.red,
                                      fontSize: 16.0 ,)), // Customize text style
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Container(
                                  child: Image.asset(
                                    'assets/images/profilee.png',
                                    width: innerWidth * 0.38,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                 const SizedBox(
                    height: 30,
                  ),
                 const Text(
                    'My current reservations',
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
                    child: GetBuilder<ProfileControllerImp>(builder: ((controller) => HandlingDataView(
                        statusRequest: controller.statusRequest,   widget :
                    GridView.builder(
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
                        return testListCardReservation(controller.reservationvehicle[index])
                        ;
                      },
                    )
                    )
                    )
                    ),
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
