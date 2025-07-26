import 'package:currency_picker/currency_picker.dart';
import 'package:finzefy_app/core/route.dart';
import 'package:finzefy_app/data/controllers/auth_controller.dart';
import 'package:finzefy_app/presentation/widgets/custom_button.dart';
import 'package:finzefy_app/presentation/widgets/custom_text.dart';
import 'package:finzefy_app/utils/app_colors.dart';
import 'package:finzefy_app/utils/nav.dart';
import 'package:finzefy_app/utils/reusables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
              fontSize: 25.sp,
              fontWeight: FontWeight.bold,
            ),
           const CustomText(
              text:
                  'Choose the primary currency for your account. This can not be changed',
              //textAlign: TextAlign.center,
              color: AppColors.kGrey7F,
            ),
            Consumer<AuthController>(
              builder: (context, controller, child) {
                return InkWell(
                  onTap: () {
                    showCurrencyPicker(
                  context: context,
                  showFlag: true,
                  showSearchField: true,
                  showCurrencyName: true,
                  showCurrencyCode: true,
                  favorite: ['NGN'],
                  onSelect: (Currency currency) {
                    controller.onCurrencySelected(currency.code);
                    print('Select currency: ${currency.code}');
                  },);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 40.h, bottom: 30.h),
                    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                    decoration: BoxDecoration(
                        color: AppColors.kLightPrimaryColor,
                        borderRadius: BorderRadius.circular(15.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(text: 'Select Currency'),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                          decoration: BoxDecoration(
                              color: AppColors.kWhite,
                              borderRadius: BorderRadius.circular(25.r)),
                          child:  Row(
                            children: [
                              CustomText(text: controller.selectedCurrency),
                              Width(w: 5),
                              Icon(Icons.expand_more)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
            ),
            CustomButton(onPressed: () {
              removeAllAndPushScreen(AppRoute.dashboard);
            }, text: 'Set Currency')
          ],
        ),
      ),
    );
  }
}
