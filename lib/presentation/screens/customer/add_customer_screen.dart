import 'package:finzefy_app/presentation/screens/services/invoice/create_invoice_screen.dart';
import 'package:finzefy_app/presentation/widgets/custom_button.dart';
import 'package:finzefy_app/presentation/widgets/custom_text.dart';
import 'package:finzefy_app/presentation/widgets/custom_textfield.dart';
import 'package:finzefy_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCustomerScreen extends StatelessWidget {
  const AddCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Add customer'),
      backgroundColor: AppColors.kGreyF9,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        physics: const BouncingScrollPhysics(),
        child: SafeArea(child: Column(
          children: [
            Container(
               margin: EdgeInsets.only(bottom: 20.h),
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.kWhite,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(text: 'Customer Information', fontSize: 16, fontWeight: FontWeight.w500,),
                  Row(
                    children: [
                      const Expanded(child: CustomTextField(title: 'First name',)),
                      SizedBox(width: 10.w,),
                      const Expanded(child: CustomTextField(title: 'Last name',)),
                    ],
                  ),
                  const CustomTextField(title: 'Company name',),
                  const CustomTextField(title: 'Email address',),
                  const CustomTextField(title: 'Phone number',),
                ],
              ),
            ),
            
            Container(
              margin: EdgeInsets.only(bottom: 20.h),
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.kWhite,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(text: 'Billing Address / Shipping Address', fontSize: 16, fontWeight: FontWeight.w500,),
                  const CustomTextField(title: 'Billing address',hintText: 'No 10, ifelajulo street',),
                  Row(
                    children: [
                      const Expanded(child: CustomTextField(hintText: 'City',)),
                      SizedBox(width: 10.w,),
                      const Expanded(child: CustomTextField(hintText: 'State',)),
                    ],
                  ),
                   Row(
                    children: [
                      const Expanded(child: CustomTextField(hintText: 'Zip code',)),
                      SizedBox(width: 10.w,),
                      const Expanded(child: CustomTextField(hintText: 'Country',)),
                    ],
                  ),
                ],
              ),
            ),
            CustomButton(onPressed: (){}, text: 'Add Customer')
          ],
        )),
      ),
    );
  }
}