import 'package:finzefy_app/config/route.dart';
import 'package:finzefy_app/presentation/widgets/custom_button.dart';
import 'package:finzefy_app/presentation/widgets/custom_text.dart';
import 'package:finzefy_app/presentation/widgets/custom_textfield.dart';
import 'package:finzefy_app/utils/app_colors.dart';
import 'package:finzefy_app/utils/error_dialog.dart';
import 'package:finzefy_app/utils/nav.dart';
import 'package:finzefy_app/utils/reusables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetNewPasswordScreen extends StatelessWidget {
  const SetNewPasswordScreen({super.key});

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
              text: 'Set New Password',
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
            const CustomText(
              text: 'Enter your new password below.',
              color: AppColors.kGrey7F,
              fontSize: 16,
            ),
            const CustomTextField(
              hintText: 'Password',
            ),

            const CustomTextField(
              hintText: 'Confirm Password',
            ),
           
            Height(h: 30),
            CustomButton(onPressed: () {
              showCustomDialog('You have successfully changed your password', onTap: () {
                removeAllAndPushScreen(AppRoute.login);
              },);
            }, text: 'Submit'),
            
                 
          
          ],
        ),
      ),
    );
  }
}
