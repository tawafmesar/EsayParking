
import 'package:esaypark/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String textbutton;
  final String image;
  final bool? active   ;
  const CustomButtonAppBar(
      {Key? key,
        required this.textbutton,
        required this.image,
        required this.onPressed,
        required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: active == true ? Color(0xFFCEEAFD) : Color(0xFFFEFEFE),

      onPressed: onPressed,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(
          image, // Replace 'icon.png' with the actual path to your image in the assets folder
          width: 48, // You can adjust the width and height to fit your needs
          height: 48,
        ),
        Text(textbutton,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: active == true ? AppColor.primaryColor : Colors.black))
      ]),
    );
  }
}


