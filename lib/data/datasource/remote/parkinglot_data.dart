

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class ParkingLotData {
  Crud crud;

  ParkingLotData(this.crud);

  getdata() async {
    var response = await crud.postData(AppLink.viewparkinglot, {});
    return response.fold((l) => l, (r) => r);
  }



  addreservationdata(String vehicle_id ,String parkinglot_id  ) async {
    var response = await crud.postData(AppLink.addreservation, {
      "vehicle_id" : vehicle_id ,
      "parkinglot_id" : parkinglot_id  ,
    });
    return response.fold((l) => l, (r) => r);
  }





}