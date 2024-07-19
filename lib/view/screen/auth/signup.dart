import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/signup_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/LogoAuth.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtexttitleauth.dart';
import '../../widget/auth/textsignup.dart';


class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.secoundColor2,
        elevation: 10.0,
        title: Text('Signup',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: AppColor.whitee)),
      ),

      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<SignUpControllerImp>(
            builder:
                (controller) =>

                HandlingDataViewRequest(statusRequest: controller.statusRequest,
                    widget:
                    Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Form(
                key: controller.formstate,
                child: ListView(children: [
                  const SizedBox(height: 20),
                  const LogoAuth(),
                  const CustomTextTitleAuth(text: "Welcome"),
                  const SizedBox(height: 10),
                  const CustomTextBodyAuth(
                      text:
                      "To Use This App You Must Have An Acoount"),
                  const SizedBox(height: 15),

                  CustonTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 3, 20, "username");
                    },
                    mycontroller: controller.username,
                    hinttext: "Enter Username",
                    iconData: Icons.person_outline,
                    labeltext: "Username",

                    // mycontroller: ,
                  ),

                  CustonTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 3, 35, "email");
                    },
                    mycontroller: controller.email,
                    hinttext: "Enter Your Email",
                    iconData: Icons.email_outlined,
                    labeltext: "Email",
                    // mycontroller: ,
                  ),

                  CustonTextFormAuth(
                    isNumber: true,

                    valid: (val) {
                      return validInput(val!, 2, 19, "phone");
                    },
                    mycontroller: controller.phone,
                    hinttext: "Enter phone number",
                    iconData: Icons.phone_android_outlined,
                    labeltext: "Phone",
                    // mycontroller: ,
                  ),
                  CustonTextFormAuth(
                    isNumber: false,

                    valid: (val) {
                      return validInput(val!, 3, 30, "password");
                    },
                    obscureText:true,

                    mycontroller: controller.password,
                    hinttext: "Enter Your  Password",
                    iconData: Icons.lock_outline,
                    labeltext: "Password",
                    // mycontroller: ,
                  ),

                  CustomButtomAuth(text: "Create", onPressed: () {
                    controller.signUp();
                  }),
                  const SizedBox(height: 40),
                  CustomTextSignUpOrSignIn(
                    textone: "Do you have an account ?",
                    texttwo: "Go to Login",
                    onTap: () {
                      controller.goToSignIn();
                    },
                  ),
                ]),
              ),
            )
        )),
      ),

    );
  }
}