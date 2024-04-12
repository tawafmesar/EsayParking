

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class ReservationData {
  Crud crud;

  ReservationData(this.crud);
  getdata(String user_id) async {
    var response = await crud.postData(AppLink.viewreservation, {
      "user_id" : user_id });
    return response.fold((l) => l, (r) => r);
  }


  removeReservationData(String id) async {
    var response = await crud.postData(
        AppLink.removereservation, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

}