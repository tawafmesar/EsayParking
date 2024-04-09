import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../controller/auth/verfiycodesignup_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/color.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtexttitleauth.dart';

class VerfiyCodeSignUp extends StatelessWidget {
  const VerfiyCodeSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeSignUpControllerImp controller =
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.secoundColor2,
        elevation: 10.0,
        title: Text('Account Verification',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: AppColor.whitee)),
      ),

      body: GetBuilder<VerifyCodeSignUpControllerImp>(
          builder: (controller) => HandlingDataViewRequest(statusRequest: controller.statusRequest, widget: Container(
            padding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: ListView(children: [
              const SizedBox(height: 20),
              const CustomTextTitleAuth(text: "Verification Code"),
              const SizedBox(height: 10),
              const CustomTextBodyAuth(

                  text: "Please enter the verification code sent to your email"),

              const SizedBox(height: 15),
              OtpTextField(
                fieldWidth: 50.0,
                borderRadius: BorderRadius.circular(20),
                numberOfFields: 5,
                borderColor: const Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  controller.goToSuccessSignUp(verificationCode);
                }, // end onSubmit
              ),
              const SizedBox(height: 40),
              InkWell(onTap: (){
                controller.reSend() ;
              },child: Center(child: Text("Resend Verification Code" , style: TextStyle(color: AppColor.primaryColor , fontSize: 20 ),)),)
            ]),
          )
          )

      ),
    );
  }
}