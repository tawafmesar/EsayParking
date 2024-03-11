import 'package:esaypark/view/screen/addvehicle.dart';
import 'package:esaypark/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:esaypark/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:esaypark/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:esaypark/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:esaypark/view/screen/auth/login.dart';
import 'package:esaypark/view/screen/auth/signup.dart';
import 'package:esaypark/view/screen/auth/success_signup.dart';
import 'package:esaypark/view/screen/auth/verifycodesignup.dart';
import 'package:esaypark/view/screen/home.dart';
import 'package:esaypark/view/screen/vehicle.dart';
import 'view/screen/spalshscreen.dart';
import 'core/constant/routes.dart';
import 'package:get/get.dart';
import 'core/middleware/mymiddleware.dart';


List<GetPage<dynamic>>? routes = [
  GetPage(name: "/",
      page: () =>  Login() , middlewares: [
    MyMiddleWare()
  ]),
  GetPage(name: AppRoute.splash, page: () =>  SplashScreen()),

  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successResetpassword, page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  GetPage(name: AppRoute.homepage , page: () =>  HomeScreen()),

  GetPage(name: AppRoute.vehicleScreen , page: () =>  VehicleScreen()),
  GetPage(name: AppRoute.addvehicleScreen , page: () =>  AddVehicleScreen()),






];