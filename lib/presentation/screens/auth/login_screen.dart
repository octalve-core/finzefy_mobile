// ignore_for_file: void_checks

import 'package:finzefy_app/core/route.dart';
import 'package:finzefy_app/data/controllers/auth_controller.dart';
import 'package:finzefy_app/data/models/auth/login_model.dart';
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

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(

      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Consumer<AuthController>(
          builder: (context, controller, child) {
            return Column(
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
                 CustomTextField(
                  hintText: 'Email',
                  controller: emailController,
                ),
                 CustomTextField(
                  hintText: 'Password',
                  controller: passwordController,
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
                CustomButton(onPressed: (){
                    if (emailController.text.isEmpty) {
                      return showToast(msg: 'Kindly enter your email address');
                    }
                    if (passwordController.text.isEmpty) {
                      return showToast(msg: 'Kindly enter your password');
                    }
                  showLoadingDialog(context);
                  final payload = LoginPayload(password: passwordController.text.trim(), email: emailController.text.trim());
                  controller.login(payload).then((ResponseModel response){
                    popScreen();
                    if(response.isSuccess){
                       removeAllAndPushScreen(AppRoute.dashboard);
                    }else{
                      showInfoDialog(response.message ?? AppString.somethimgWentWrong);
                    }
                  });
                  
                }, text: 'Login'),
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
            );
          }
        ),
      ),
    );
  }
}
