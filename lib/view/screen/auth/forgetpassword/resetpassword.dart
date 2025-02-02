import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/forgetpassword/resetpassword_controller.dart';
import '../../../../core/class/handlingdataview.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/functions/validinput.dart';
import '../../../widget/auth/custombuttonauth.dart';
import '../../../widget/auth/customtextbodyauth.dart';
import '../../../widget/auth/customtextformauth.dart';
import '../../../widget/auth/customtexttitleauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.secoundColor2,
        elevation: 10.0,
        title: Text('Reset Password',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: AppColor.whitee)),
      ),

        body:GetBuilder<ResetPasswordControllerImp>(
            builder: (controller) =>


                HandlingDataViewRequest(statusRequest: controller.statusRequest,
                  widget:
                  Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: controller.formstate,
          child: ListView(children: [
            const SizedBox(height: 20),
            CustomTextTitleAuth(text: "New Password"),
            const SizedBox(height: 15),
            CustonTextFormAuth(
              isNumber: false ,
              obscureText: true,

              valid: (val) {
                return validInput(val!, 3, 40, "password");
              },
              mycontroller: controller.password,
              hinttext: "Enter your password",
              iconData: Icons.lock_outline,
              labeltext: "19".tr,
              // mycontroller: ,
            ),
            CustonTextFormAuth(
              isNumber: false ,
              obscureText: true,

              valid: (val) {
                return validInput(val!, 3, 40, "password");
              },
              mycontroller: controller.repassword,
              hinttext: "Re-enter your password",
              iconData: Icons.lock_outline,
              labeltext:"Confirm Password",
              // mycontroller: ,
            ),
            CustomButtomAuth(
                text: "Save",
                onPressed: () {
                  controller.goToSuccessResetPassword();
                }),
            const SizedBox(height: 40),
          ]),
        ),
      ),))
    );
  }
}