import 'package:finzefy_app/presentation/widgets/custom_text.dart';
import 'package:finzefy_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
       this.labelText,
      this.suffixIcon,
      this.controller,
      this.obscureText,
      this.onTapSuffixIcon,
      this.onChanged,
      this.borderColor,
      this.fieldHeight,
      this.filled= true,
      this.readOnly,
      this.onTap,
      this.textColor,
      this.hintText,
      this.keyBoardType,
      this.inputFormatter,
      this.prefixIcon,
      this.hasPadding = true,
      this.title,
      this.minLines,
      this.maxLines
      });
  final String? labelText;
  final String? hintText;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final bool? obscureText;
  final VoidCallback? onTapSuffixIcon;
  final Function(String)? onChanged;
  final Color? borderColor;
  final Color? textColor;
  final double? fieldHeight;
  final bool? filled;
  final bool? readOnly;
  final VoidCallback? onTap;
  final TextInputType? keyBoardType;
  final Widget? prefixIcon;
  final bool hasPadding;
  final String? title;
  final int? minLines;
  final int? maxLines;
  
 final List<TextInputFormatter>? inputFormatter;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:hasPadding? 20.h : 0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        if(title!=null)  Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: CustomText(text: title!, color: AppColors.kGreyAE,),
        ),
          SizedBox(
           // height:fieldHeight?? 108.h,
            child: TextFormField(
              textCapitalization: TextCapitalization.sentences,
              obscureText: obscureText ?? false,
              controller: controller,
              onChanged: onChanged,
              cursorColor: AppColors.kPrimaryColor,
              keyboardType: keyBoardType,
              minLines: minLines,
              maxLines: maxLines,
              //cursorHeight: 15.h,
             readOnly: readOnly?? false,
             inputFormatters: inputFormatter,
             onTap: onTap,
              decoration: InputDecoration(
                filled: filled,
                fillColor: AppColors.kGreyF9,
                hintText: hintText,
                prefixIcon: prefixIcon,
                isDense: true,
                  hintStyle: TextStyle(
                      color: textColor?? AppColors.kGrey7F,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                  labelStyle: TextStyle(
                      color: textColor?? AppColors.kGrey7F,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                  labelText: labelText,
                  suffixIcon: GestureDetector(
                      onTap: onTapSuffixIcon, child:  Icon(suffixIcon)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                      borderSide:  BorderSide.none),
                  enabledBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                      borderSide:  BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                      borderSide:  BorderSide(color:borderColor?? AppColors.kPrimaryColor))
                  ),
            
            ),
          ),
        ],
      ),
    );
  }
}
