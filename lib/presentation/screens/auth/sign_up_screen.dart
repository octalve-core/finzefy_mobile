// ignore_for_file: void_checks

import 'package:finzefy_app/core/route.dart';
import 'package:finzefy_app/data/controllers/auth_controller.dart';
import 'package:finzefy_app/data/models/auth/sign_up_model.dart';
import 'package:finzefy_app/data/models/general/response.dart';
import 'package:finzefy_app/presentation/widgets/custom_button.dart';
import 'package:finzefy_app/presentation/widgets/custom_text.dart';
import 'package:finzefy_app/presentation/widgets/custom_textfield.dart';
import 'package:finzefy_app/utils/app_colors.dart';
import 'package:finzefy_app/utils/app_string.dart';
import 'package:finzefy_app/utils/custom_toast.dart';
import 'package:finzefy_app/utils/error_dialog%20copy.dart';
import 'package:finzefy_app/utils/loading_dialog.dart';
import 'package:finzefy_app/utils/nav.dart';
import 'package:finzefy_app/utils/reusables.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Consumer<AuthController>(
          builder: (context, controller, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: 'Create Account',
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
                const CustomText(
                  text:
                      'It takes less than a minute to create an account. Already have an account? ',
                  color: AppColors.kGrey7F,
                  fontSize: 16,
                ),
                 CustomTextField(
                  hintText: 'First Name',
                  controller: firstNameController,
                ),
                 CustomTextField(
                  hintText: 'Last Name',
                  controller: lastNameController,
                ),
                 CustomTextField(
                  hintText: 'Email',
                  controller: emailController,
                ),
                 CustomTextField(
                  hintText: 'Phone number',
                  controller: phoneNumberController,
                ),
            
                 CustomTextField(
                  hintText: 'Password',
                  suffixIcon: Icons.visibility,
                  controller: passwordController,
                ),
                const Height(h: 30),
                CustomButton(onPressed: () {
                  if (firstNameController.text.isEmpty) {
                  return showToast(msg: 'Kindly enter your first name');
                }
                if (lastNameController.text.isEmpty) {
                  return showToast(msg: 'Kindly enter your last name');
                }
                if (emailController.text.isEmpty) {
                  return showToast(msg: 'Kindly enter your email address');
                }
                if (passwordController.text.isEmpty) {
                  return showToast(msg: 'Kindly enter your password');
                }
                  showLoadingDialog(context);
                  final payload = SignUpPayload(password: passwordController.text.trim(), email: emailController.text.trim(), firstName: firstNameController.text.trim(), lastName: lastNameController.text.trim(), phoneNumber: phoneNumberController.text.trim());
                  controller.signUpUser(payload).then((ResponseModel response){
                    popScreen();
                    if(response.isSuccess){
                      pushNamed(AppRoute.verifyEmailOtp, arguments: response.data);
                    }else{
                      showInfoDialog(response.message?? AppString.somethimgWentWrong);
                    }
                  });
                  
                }, text: 'Create Account'),
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
                      child: RichText(text: TextSpan(
                        children: [
                             TextSpan(text: "Have an account? ",style:  TextStyle(
                                        color: AppColors.kBlack72,
                                        fontSize: 14.sp, 
                                      ),),
                                  TextSpan(
                                      text: "Sign in",
                                      style: TextStyle(
                                        color: AppColors.kPrimaryColor,
                                        fontSize: 14.sp, fontWeight: FontWeight.w500
                                      ),
                                       recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              pushNamed(AppRoute.login);
                            }
                                        ),
                        ]
                      ),
                       
                      ),
                    ),
              ],
            );
          }
        ),
      ),
    );
  }
}

