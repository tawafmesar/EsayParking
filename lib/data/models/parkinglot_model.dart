class parkinglot_model {
  String? parkinglotId;
  String? parkinglotName;
  String? parkinglotDept;
  String? parkinglotImg;
  String? parkinglotStatus;
  String? latitude;
  String? longitude;

  parkinglot_model(
      {this.parkinglotId,
      this.parkinglotName,
      this.parkinglotDept,
      this.parkinglotImg,
      this.parkinglotStatus,
      this.latitude,
      this.longitude});

  parkinglot_model.fromJson(Map<String, dynamic> json) {
    parkinglotId = json['parkinglot_id'];
    parkinglotName = json['parkinglot_name'];
    parkinglotDept = json['parkinglot_dept'];
    parkinglotImg = json['parkinglot_img'];
    parkinglotStatus = json['parkinglot_status'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parkinglot_id'] = this.parkinglotId;
    data['parkinglot_name'] = this.parkinglotName;
    data['parkinglot_dept'] = this.parkinglotDept;
    data['parkinglot_img'] = this.parkinglotImg;
    data['parkinglot_status'] = this.parkinglotStatus;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}