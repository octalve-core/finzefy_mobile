import 'package:finzefy_app/config/route.dart';
import 'package:finzefy_app/presentation/widgets/custom_button.dart';
import 'package:finzefy_app/presentation/widgets/custom_text.dart';
import 'package:finzefy_app/utils/app_colors.dart';
import 'package:finzefy_app/utils/nav.dart';
import 'package:finzefy_app/utils/reusables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final h = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
                color: Colors.red,
                child: Image.asset(
                  'assets/images/onboarding.png',
                  width: w,
                  height: h,
                  fit: BoxFit.cover,
                )),
            Positioned(
                top: h * 0.63,
                right: 20.w,
                left: 20.w,
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   const CustomText(
                      text: 'Spend Smart, \nLive Better.',
                      color: AppColors.kWhite,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                   const CustomText(
                      text:
                          'Smart Spending Today Leads To A Better Life Tomorrow.',
                      fontSize: 16,
                      color: AppColors.kWhite,
                    ),
                   const Height(h: 20),
                    CustomButton(onPressed: ()=> pushNamed(AppRoute.signUp), text: 'Create Account'),
                    const Height(h: 20),
                   Center(
                     child:  InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () => pushNamed(AppRoute.login),
                        child: CustomText(text: 'Already have an account? Log in', color: AppColors.kGreyD7,)),
                   )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
