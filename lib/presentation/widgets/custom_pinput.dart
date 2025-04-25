import 'package:finzefy_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
class CustomPinput extends StatelessWidget {
  const CustomPinput(
      {super.key, required this.lenght, 
       this.controller, 
      required this.onChanged,
      this.onCompleted,
      this.mainAxisAlignment
      });
  final int lenght;
  final TextEditingController? controller;
  final Function(String) onChanged;
  final Function(String)? onCompleted;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: 45.w,
      child: Pinput(
        mainAxisAlignment:mainAxisAlignment?? MainAxisAlignment.spaceBetween,
        length: lenght,
        controller: controller,
        onChanged:onChanged,
        onCompleted: onCompleted,
        pinContentAlignment: Alignment.center,
        
        defaultPinTheme: PinTheme(
             width: 45.w,
             //height: 45.w,
            textStyle:  TextStyle(color: AppColors.kBlack40, fontSize: 20.sp, ),
            decoration: BoxDecoration(
                color: AppColors.kSecondaryColor,
                borderRadius: BorderRadius.circular(10.sp))),
        disabledPinTheme: PinTheme(
           width: 45.w,
            height: 45.w,
          decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.kGreyD7,
              ),
              borderRadius: BorderRadius.circular(10.sp)),
          textStyle: const TextStyle(color: AppColors.kBlack40),
        ),
       
        // followingPinTheme: PinTheme(
        //     width: 53.w,
        //     height: 50.w,
        //     decoration: BoxDecoration(
        //         border: Border.all(color: AppColors.kPrimaryColor),
        //         borderRadius: BorderRadius.circular(10.sp))),
      ),
    );
  }
}
