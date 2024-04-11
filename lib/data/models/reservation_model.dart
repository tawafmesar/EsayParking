class reservation_model {
  String? reservationId;
  String? reservationDate;
  String? reservationStatus;
  String? vehicleId;
  String? plateNumber;
  String? vehicleDesc;
  String? vehicleType;
  String? usersId;
  String? usersName;
  String? usersEmail;
  String? usersPhone;

  reservation_model(
      {this.reservationId,
        this.reservationDate,
        this.reservationStatus,
        this.vehicleId,
        this.plateNumber,
        this.vehicleDesc,
        this.vehicleType,
        this.usersId,
        this.usersName,
        this.usersEmail,
        this.usersPhone});

  reservation_model.fromJson(Map<String, dynamic> json) {
    reservationId = json['reservation_id'];
    reservationDate = json['reservation_date'];
    reservationStatus = json['reservation_status'];
    vehicleId = json['vehicle_id'];
    plateNumber = json['plate_number'];
    vehicleDesc = json['vehicle_desc'];
    vehicleType = json['vehicle_type'];
    usersId = json['users_id'];
    usersName = json['users_name'];
    usersEmail = json['users_email'];
    usersPhone = json['users_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reservation_id'] = this.reservationId;
    data['reservation_date'] = this.reservationDate;
    data['reservation_status'] = this.reservationStatus;
    data['vehicle_id'] = this.vehicleId;
    data['plate_number'] = this.plateNumber;
    data['vehicle_desc'] = this.vehicleDesc;
    data['vehicle_type'] = this.vehicleType;
    data['users_id'] = this.usersId;
    data['users_name'] = this.usersName;
    data['users_email'] = this.usersEmail;
    data['users_phone'] = this.usersPhone;
    return data;
  }
}