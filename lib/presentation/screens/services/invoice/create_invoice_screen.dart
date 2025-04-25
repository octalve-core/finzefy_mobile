import 'package:finzefy_app/presentation/widgets/custom_button.dart';
import 'package:finzefy_app/presentation/widgets/custom_text.dart';
import 'package:finzefy_app/presentation/widgets/custom_textfield.dart';
import 'package:finzefy_app/utils/app_colors.dart';
import 'package:finzefy_app/utils/reusables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateInvoiceScreen extends StatelessWidget {
  const CreateInvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: SafeArea(
            child: Container(
              height: 50.h,
              //color: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(Icons.navigate_before),
                  CustomText(text: 'Invoice'),
                  CustomText(
                    text: 'History',
                    color: AppColors.kPrimaryColor,
                  )
                ],
              ),
            ),
          )),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
        child: SafeArea(
            child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.kWhite,
              ),
              child: Column(
                children: [
                  CustomTextField(
                    controller: TextEditingController(text: 'FZ-001INV'),
                    hasPadding: false,
                    title: 'Invoive Number',
                  ),
                  CustomTextField(
                      controller: TextEditingController(text: 'Paid'),
                      title: 'Invoive Status',
                      suffixIcon: Icons.expand_more),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                          child: CustomTextField(
                              controller: TextEditingController(text: 'Dart'),
                              title: 'Select Customer',
                              suffixIcon: Icons.expand_more)),
                      const Width(w: 10),
                      const CustomServiceButton(
                        text: 'Add New',
                      )
                    ],
                  ),
                  CustomTextField(
                      controller: TextEditingController(text: 'NGN'),
                      title: 'Currency',
                      suffixIcon: Icons.expand_more),
                  Row(
                    children: [
                      Expanded(
                          child: CustomTextField(
                        controller: TextEditingController(text: '1/6/2024'),
                        title: 'Date Created',
                      )),
                      const Width(w: 10),
                      Expanded(
                          child: CustomTextField(
                        controller: TextEditingController(text: '1/6/2024'),
                        title: 'Date Due',
                      )),
                    ],
                  ),
                ],
              ),
            ),
            const Height(h: 10),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.kWhite,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 30.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.kGreenDA,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: const Column(
                  children: [
                    CustomText(
                      text: 'Add Invoice Product or Service',
                      color: AppColors.kPrimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                    Height(h: 10),
                    CustomServiceButton(
                      text: 'Add New',
                    )
                  ],
                ),
              ),
            ),
            const Height(h: 10),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.kWhite,
              ),
              child: Column(
                children: [
                  CustomTextField(
                      controller: TextEditingController(text: 'Weekly'),
                      title: 'Reoccuring Duration Period',
                      suffixIcon: Icons.expand_more),
                  const CustomTextField(
                    hintText: 'Message...',
                    title: 'Mail for customer',
                    minLines: 3,
                  ),
                ],
              ),
            ),
            const Height(h: 10),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.kWhite,
              ),
              child: Column(
                children: [
                  CustomTextField(
                    controller: TextEditingController(text: 'FZ-001INV'),
                    hasPadding: false,
                    title: 'Invoice Subject',
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                          child: CustomTextField(
                              controller: TextEditingController(text: 'Dart'),
                              title: 'Select Person',
                              suffixIcon: Icons.expand_more)),
                      const Width(w: 10),
                      const CustomServiceButton(
                        text: 'Salesperson',
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Height(h: 10),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.kWhite,
              ),
              child: const CustomTextField(
                  hasPadding: false,
                  title: 'Payment Details',
                  hintText: 'Select or Add Payment Method',
                  suffixIcon: Icons.expand_more),
            ),
            const Height(h: 10),
            Container(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.kWhite,
                ),
                child:  Column(
                  children: [
                    const SummaryWidget(name: 'Subtotal', value: '₦556,250'),
                    const Height(h: 10),
                    const SummaryWidget(name: 'Discount', value: '₦556,250'),
                    const Height(h: 10),
                    const SummaryWidget(name: 'Vat', value: '₦556,250'),
                    const Height(h: 10),
                    const SummaryWidget(name: 'Total', value: '₦556,250'),
                    const Height(h: 30),
                    CustomButton(onPressed: (){}, text: 'Create Invoice')

                  ],
                )),
          ],
        )),
      ),
    );
  }
}

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key, required this.name, required this.value});
  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: name,
          fontWeight: FontWeight.w400,
          fontSize: 13,
          color: AppColors.kBlack4B.withOpacity(0.4),
        ),
        CustomText(text: value, color: AppColors.kBlack4B,)
      ],
    );
  }
}

class CustomServiceButton extends StatelessWidget {
  const CustomServiceButton({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: AppColors.kPrimaryColor),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.add,
            color: AppColors.kWhite,
          ),
          CustomText(
            text: text,
            color: AppColors.kWhite,
          )
        ],
      ),
    );
  }
}
