import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "Invalid username";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Invalid email";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Invalid phone number";
    }
  }

  if (val.isEmpty) {
    return "Cannot be empty";
  }

  if (val.length < min) {
    return "Should not be less than $min";
  }

  if (val.length > max) {
    return "Should not be greater than $max";
  }
}
