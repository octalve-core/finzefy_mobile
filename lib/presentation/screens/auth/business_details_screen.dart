import 'package:finzefy_app/config/route.dart';
import 'package:finzefy_app/presentation/widgets/custom_button.dart';
import 'package:finzefy_app/presentation/widgets/custom_text.dart';
import 'package:finzefy_app/presentation/widgets/custom_textfield.dart';
import 'package:finzefy_app/utils/app_colors.dart';
import 'package:finzefy_app/utils/nav.dart';
import 'package:finzefy_app/utils/reusables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BusinessDetailsScreen extends StatelessWidget {
  const BusinessDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () => pushNamed(AppRoute.setCurrency),
            child: Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: CustomText(text: 'Skip', color: AppColors.kPrimaryColor,),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: Column(
          children: [
            const UploadWidget(name: 'Logo'),
            const CustomTextField(
              hintText: 'Enter your business name',
              title: 'Businesss Name',
            ),
            const CustomTextField(
              hintText: 'Enter your business address',
              title: 'Businesss Address',
            ),
            const CustomTextField(
              hintText: 'Enter your business phone number',
              title: 'Businesss Phone Number',
            ),
            const CustomTextField(
              hintText: 'Enter your business description',
              title: 'Businesss Description',
            ),
            const CustomTextField(
              hintText: 'Enter your business RC Number',
              title: 'RC Number (Optional)',
            ),
            const CustomTextField(
              hintText: 'Enter your business Tax ID',
              title: 'Tax ID (Optional)',
            ),
            const CustomTextField(
              hintText: 'Enter your business Instagram Profile name',
              title: 'Instagram Profile name (Optional)',
            ),
            const CustomTextField(
              hintText: 'Enter your business Facebook Profile name',
              title: 'Facebook Profile name (Optional)',
            ),
            const CustomTextField(
              hintText: 'Enter your business X (twitter) Profile name',
              title: 'X (twitter) Profile name (Optional)',
            ),
            const CustomTextField(
              hintText: 'Enter your business Website link',
              title: 'Website link',
            ),
            const Height(h: 20),
            const UploadWidget(name: 'Signature'),
            const Height(h: 30),
            CustomButton(onPressed: (){
              pushNamed(AppRoute.setCurrency);
            }, text: 'Save')

          ],
        ),
      ),
    );
  }
}


class UploadWidget extends StatelessWidget {
  const UploadWidget({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return  Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                  border: Border.all(color: AppColors.kGrey7F)),
              child: Column(
                children: [
                  SvgPicture.asset('assets/svgs/upload.svg'),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child:  CustomText(
                      text: 'Upload $name',
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                  const CustomText(
                    text: 'SVG, PNG, JPG or GIF (max. 800x400px)',
                    fontSize: 12,
                    color: AppColors.kGrey47,
                  ),
                   
                ],
              ),
            );
  }
}