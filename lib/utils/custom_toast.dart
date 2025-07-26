import 'package:bot_toast/bot_toast.dart';
import 'package:finzefy_app/utils/app_colors.dart';
import 'package:finzefy_app/utils/reusables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// void showToast({
//  required String msg,
//  bool isSuccess = true
// }){
//   toast(msg, bgColor: isSuccess?AppColors.kGreen: AppColors.kRed, gravity: ToastGravity.TOP);
// }

_showCustomToast({required String message,
    }) {
  Color txtColor = AppColors.kWhite;

  BotToast.showCustomNotification(
    duration: const Duration(seconds: 3),
    toastBuilder: (cancelFunc) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        width: double.infinity,
        decoration: BoxDecoration(
            color:  AppColors.kRed,
            borderRadius: BorderRadius.circular(10.r)),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
        child: Row(
          children: [
           const Icon(
              Icons.error,
              color: AppColors.kWhite,
            ),
            // SvgPicture.asset('assets/svgs/circlechecksvg.svg', color: AppColors.kWhite,),
            const Width(w: 8),
            Expanded(
                child: Text(
              message,
              maxLines: 3,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: AppColors.kWhite,
              ),
              // maxLine: 3,
            )),
            GestureDetector(
                onTap: () => BotToast.cleanAll(),
                child: const Icon(
                  Icons.close,
                  color: AppColors.kWhite,
                ))
          ],
        ),
      );
    },
  );
}

showToast({required String msg, }) {
  _showCustomToast(message: msg);
}
