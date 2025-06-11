import 'package:finzefy_app/config/route.dart';
import 'package:finzefy_app/presentation/widgets/custom_button.dart';
import 'package:finzefy_app/presentation/widgets/custom_text.dart';
import 'package:finzefy_app/presentation/widgets/custom_textfield.dart';
import 'package:finzefy_app/utils/app_colors.dart';
import 'package:finzefy_app/utils/nav.dart';
import 'package:finzefy_app/utils/reusables.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: 'Login',
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
            const CustomText(
              text: 'You are welcome back.',
              color: AppColors.kGrey7F,
              fontSize: 16,
            ),
            const CustomTextField(
              hintText: 'Email',
            ),
            const CustomTextField(
              hintText: 'Password',
            ),
           InkWell(
            onTap: () => pushNamed(AppRoute.forgotPassword),
             child: const Align(
                alignment: Alignment.centerRight,
                child: CustomText(
                  text: 'Forgot Password?',
                  color: AppColors.kPrimaryColor,
                ),
              ),
           ),
            Height(h: 30),
            CustomButton(onPressed: ()=> removeAllAndPushScreen(AppRoute.dashboard), text: 'Login'),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              child: Row(
                children: [
                  const Flexible(
                      child: Divider(
                    color: AppColors.kGreyD7,
                  )),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: const CustomText(text: 'Or'),
                  ),
                  const Flexible(
                      child: Divider(
                    color: AppColors.kGreyD7,
                  ))
                ],
              ),
            ),
            const SocialMedialCustomBtn(
                text: 'Google Sign In', imgName: 'google-icon'),
            Height(h: 20),
            Center(
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "Don\'t have an account? ",
                    style: TextStyle(
                      color: AppColors.kBlack72,
                      fontSize: 14.sp,
                    ),
                  ),
                  TextSpan(
                    text: "Sign up",
                    style: TextStyle(
                        color: AppColors.kPrimaryColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                        recognizer: TapGestureRecognizer()
                        ..onTap =()=> pushNamed(AppRoute.signUp),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
