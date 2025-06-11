import 'package:finzefy_app/config/route.dart';
import 'package:finzefy_app/presentation/widgets/custom_button.dart';
import 'package:finzefy_app/presentation/widgets/custom_pinput.dart';
import 'package:finzefy_app/presentation/widgets/custom_text.dart';
import 'package:finzefy_app/utils/app_colors.dart';
import 'package:finzefy_app/utils/nav.dart';
import 'package:finzefy_app/utils/reusables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordOtpScreen extends StatelessWidget {
  const ResetPasswordOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: 'Enter OTP',
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
            const CustomText(
              text: 'Check your email for OTP code',
              color: AppColors.kGrey7F,
              fontSize: 16,
            ),
            const Height(h: 20),
            CustomPinput(lenght: 6, onChanged: (value) {}),
            const Height(h: 20),
            CustomButton(onPressed: () {
              pushNamed(AppRoute.setNewPassword);
            }, text: 'Continue'),
            const Height(h: 20),
            const Center(
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: CustomText(text: 'Resend Code', color: AppColors.kPrimaryColor,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
