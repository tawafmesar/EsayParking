import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:esaypark/view/screen/parkinglots_map.dart';
import 'package:esaypark/view/screen/parkinglots_table.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';
import '../../core/constant/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<Widget> _pages = [
    ParkinglotsMap(),
    ParkinglotsTable(),
    const Text('Vehicles'),
    const Text('Logout')
  ];
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (selectedIndex) {
          setState(() {
            _index = selectedIndex;
          });
        },
        backgroundColor: Colors.black,
        currentIndex: _index,
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(Icons.map), label: 'Maps '),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_parking), label: 'Parking'),
          BottomNavigationBarItem(
              icon: Icon(Icons.car_rental), label: 'Vehicles'),
          BottomNavigationBarItem(
              icon: Icon(Icons.logout), label: 'Logout'),
        ],
      ),
    );
  }
}

//
// class HomeScreen extends StatelessWidget {
//   final HomeController controller = Get.put(HomeController());
//
//   @override
//   Widget build(BuildContext context) {
//     double appBarHeight = MediaQuery.of(context).size.width > 600 ? 72.0 : 56.0;
//
//
//     return Scaffold(
//
//         body: Obx(() => controller.tabPages[controller.currentTabIndex.value]),
//         bottomNavigationBar: ConvexAppBar(
//           color: AppColor.primaryColor,
//           elevation: 10,
//           backgroundColor: AppColor.splsh2,
//           height:appBarHeight ,
//           style: TabStyle.react,
//           top: -25,
//           curveSize: 100,
//
//
//           activeColor: AppColor.primaryColor,
//
//           items: const [
//             TabItem(icon: Center(child: FaIcon(FontAwesomeIcons.ccDiscover,color: AppColor.splsh,))
//                 , title: 'home'),
//             TabItem(icon: Center(child: FaIcon(FontAwesomeIcons.paperPlane,color: AppColor.splsh,))
//                 , title: 'three'),
//             TabItem(icon: Center(child: FaIcon(FontAwesomeIcons.cameraRetro,color: AppColor.splsh,)), title: 'four'),
//             TabItem(icon: Center(child: FaIcon(FontAwesomeIcons.user,color: AppColor.splsh,)), title: 'logout'),
//           ],
//           onTap: (int i) { controller.changeTabIndex(i);},
//         )
//     );
//   }
// }
