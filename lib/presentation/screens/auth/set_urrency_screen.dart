import 'package:finzefy_app/presentation/widgets/custom_button.dart';
import 'package:finzefy_app/presentation/widgets/custom_text.dart';
import 'package:finzefy_app/utils/app_colors.dart';
import 'package:finzefy_app/utils/reusables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetCurrencyScreen extends StatelessWidget {
  const SetCurrencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'Set Primary Currency',
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
           const CustomText(
              text:
                  'Choose the primary currency for your account. This can not be changed',
              //textAlign: TextAlign.center,
              color: AppColors.kGrey7F,
            ),
            Container(
              margin: EdgeInsets.only(top: 40.h, bottom: 30.h),
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              decoration: BoxDecoration(
                  color: AppColors.kLightPrimaryColor,
                  borderRadius: BorderRadius.circular(15.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: 'Select Currency'),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                    decoration: BoxDecoration(
                        color: AppColors.kWhite,
                        borderRadius: BorderRadius.circular(25.r)),
                    child: const Row(
                      children: [
                        CustomText(text: 'NGN'),
                        Width(w: 5),
                        Icon(Icons.more_horiz)
                      ],
                    ),
                  )
                ],
              ),
            ),
            CustomButton(onPressed: () {}, text: 'Set Currency')
          ],
        ),
      ),
    );
  }
}
