
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/routes.dart';
import '../core/functions/handingdatacontroller.dart';
import '../core/services/services.dart';
import '../view/screen/auth/logout.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);

  logout();
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  MyServices myServices = Get.find();


  List data = [];
  late StatusRequest statusRequest;



  List<Widget> listPage = [
    Center(child: const Text('home')),
  const Center(child: const Text('two')),
   const Center(child: const Text('three')),
   LogoutScreen(),
  ];

  List  titlebottomappbar = [
    "home" ,
    "Two" ,
    "Three" ,
    "Logout"
  ] ;


  List  iconsbottomappbar = [
    "assets/images/home.png" ,
    "assets/images/health.png" ,
    "assets/images/sign.png",
    "assets/images/logout.png"
  ] ;

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }




  @override
  logout() async {

    myServices.sharedPreferences.setString("step","1") ;

    await Future.delayed(Duration.zero); // Add this line to schedule the navigation in the next frame
    Get.offNamed(AppRoute.login);
  }


}
