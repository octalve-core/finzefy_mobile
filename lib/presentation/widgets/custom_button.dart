import 'package:finzefy_app/presentation/widgets/custom_text.dart';
import 'package:finzefy_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.bgColor,
    this.textColor,
    this.borderColor,
    this.width,
    this.textFontSize,
    this.height,
    this.isSubmit = false,
  });
  final VoidCallback onPressed;
  final String text;
  final Color? bgColor;
  final Color? textColor;
  final Color? borderColor;
  final double? width;
  final double? textFontSize;
  final double? height;
  final bool isSubmit;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isSubmit ? () {} : onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor:
              isSubmit ? Colors.grey : (bgColor ?? AppColors.kPrimaryColor),
          fixedSize:
              Size(width ?? MediaQuery.sizeOf(context).width, height ?? 50.h),
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor ?? AppColors.kPrimaryColor),
            borderRadius: BorderRadius.circular(25.sp),
          )),
      child: isSubmit
          ? const CircularProgressIndicator(
              color: Colors.black,
            )
          : CustomText(
              text: text,
              color: textColor ?? AppColors.kWhite,
              fontWeight: FontWeight.w500,
              fontSize: textFontSize ?? 16.sp,
            ),
    );
  }
}



class SocialMedialCustomBtn extends StatelessWidget {
  const SocialMedialCustomBtn({super.key, required this.text, required this.imgName});
  final String text;
  final String imgName;
  @override
  Widget build(BuildContext context) {
    return Container(
                width: double.infinity,
                height: 44.h,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.kBlack2D),
                  borderRadius: BorderRadius.circular(15.sp)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/svgs/$imgName.svg', height: 20.h, width: 20.w,),
                    SizedBox(width: 10.w,),
                    CustomText(text: text, color: AppColors.kBlack2D,)
                  ],
                ),
              );
  }
}