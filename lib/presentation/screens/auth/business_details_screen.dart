import 'package:finzefy_app/core/route.dart';
import 'package:finzefy_app/data/controllers/business_controller.dart';
import 'package:finzefy_app/data/models/business/update_business_info_payload.dart';
import 'package:finzefy_app/data/models/general/response.dart';
import 'package:finzefy_app/presentation/widgets/custom_button.dart';
import 'package:finzefy_app/presentation/widgets/custom_text.dart';
import 'package:finzefy_app/presentation/widgets/custom_textfield.dart';
import 'package:finzefy_app/utils/app_colors.dart';
import 'package:finzefy_app/utils/app_string.dart';
import 'package:finzefy_app/utils/error_dialog%20copy.dart';
import 'package:finzefy_app/utils/nav.dart';
import 'package:finzefy_app/utils/reusables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class BusinessDetailsScreen extends StatelessWidget {
   const BusinessDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final businessNameController = TextEditingController();
    final businessAddressController = TextEditingController();
    final businessPhoneNumberController = TextEditingController();
    final businessDescriptionController = TextEditingController();
    final rcNumberController = TextEditingController();
    final taxIdController = TextEditingController();
    final instagramProfileController = TextEditingController();
    final facebookProfileController = TextEditingController();
    final twitterProfileController = TextEditingController();
    final websiteLinkController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () => pushNamed(AppRoute.setCurrency),
            child: Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: const CustomText(text: 'Skip', color: AppColors.kPrimaryColor,),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: Column(
          children: [
             UploadWidget(name: 'Logo'),
             CustomTextField(
              hintText: 'Enter your business name',
              title: 'Businesss Name',
              controller: businessNameController,
            ),
             CustomTextField(
              hintText: 'Enter your business address',
              title: 'Businesss Address',
              controller: businessAddressController,
            ),
             CustomTextField(
              hintText: 'Enter your business phone number',
              title: 'Businesss Phone Number',
              controller: businessPhoneNumberController,
            ),
             CustomTextField(
              hintText: 'Enter your business description',
              title: 'Businesss Description',
              controller: businessDescriptionController,
            ),
             CustomTextField(
              hintText: 'Enter your business RC Number',
              title: 'RC Number (Optional)',
              controller: rcNumberController,
            ),
             CustomTextField(
              hintText: 'Enter your business Tax ID',
              title: 'Tax ID (Optional)',
              controller: taxIdController,
            ),
             CustomTextField(
              hintText: 'Enter your business Instagram Profile name',
              title: 'Instagram Profile name (Optional)',
              controller: instagramProfileController,
            ),
             CustomTextField(
              hintText: 'Enter your business Facebook Profile name',
              title: 'Facebook Profile name (Optional)',
              controller: facebookProfileController,
            ),
             CustomTextField(
              hintText: 'Enter your business X (twitter) Profile name',
              title: 'X (twitter) Profile name (Optional)',
              controller: twitterProfileController,
            ),
             CustomTextField(
              hintText: 'Enter your business Website link',
              title: 'Website link',
              controller: websiteLinkController,
            ),
             Height(h: 20),
             UploadWidget(name: 'Signature'),
             Height(h: 30),
            CustomButton(onPressed: (){
              final payload = UpdateBusinessInfoPayload(businessName: businessNameController.text, businessAddress: businessAddressController.text, businessDescription: businessDescriptionController.text, rcNumber: rcNumberController.text, taxId: taxIdController.text, digitalSignature: '');
              context.read<BusinessController>().updateBusinessInfo(payload).then((ResponseModel response){
                popScreen();
                if(response.isSuccess){
                  pushNamed(AppRoute.setCurrency);
                }else{
                  showInfoDialog(response.message ?? AppString.somethimgWentWrong);
                }
              });
              
            }, text: 'Save')

          ],
        ),
      ),
    );
  }
}


class UploadWidget extends StatelessWidget {
   UploadWidget({super.key, required this.name});
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
                   CustomText(
                    text: 'SVG, PNG, JPG or GIF (max. 800x400px)',
                    fontSize: 12,
                    color: AppColors.kGrey47,
                  ),
                   
                ],
              ),
            );
  }
}