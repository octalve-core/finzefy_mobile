import 'package:finzefy_app/core/route.dart';
import 'package:finzefy_app/presentation/widgets/custom_button.dart';
import 'package:finzefy_app/presentation/widgets/custom_text.dart';
import 'package:finzefy_app/presentation/widgets/custom_textfield.dart';
import 'package:finzefy_app/utils/app_colors.dart';
import 'package:finzefy_app/utils/bottom_sheet.dart';
import 'package:finzefy_app/utils/error_dialog.dart';
import 'package:finzefy_app/utils/nav.dart';
import 'package:finzefy_app/utils/reusables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateInvoiceScreen extends StatelessWidget {
  const CreateInvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> invoiceStatusList = [
      'Paid',
      'Unpaid',
      'Reoccurring',
      'Refunded',
      'Overdue'
    ];

     List<String> customerList = [
      'Hammed',
      'Aminullahi',
      'Kolapo',
      'Adedeji',
    ];

    List<String> currencyList = [
      'Nigerian Naira',
      'United States Dollar',
      'United Arab Emirates Dirham',
      'Afghan Afghani',
    ];
    return Scaffold(
      appBar: customAppBar(title: 'Invoice', suffixText: 'History'),
      backgroundColor: AppColors.kGreyF9,
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
                    readOnly: true,
                  ),
                  CustomTextField(
                    controller: TextEditingController(text: 'Paid'),
                    title: 'Invoive Status',
                    readOnly: true,
                    suffixIcon: Icons.expand_more,
                    borderColor: Colors.transparent,
                    onTap: () {
                      showCustomBottomShhet(
                          context,
                          CustomeBottomSheetItem(
                              headerText: 'Select invoice status',
                            
                              items: invoiceStatusList,
                              canSearch: false,
                              ));
                    },
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: TextEditingController(text: 'Dart'),
                          title: 'Select Customer',
                          readOnly: true,
                          borderColor: Colors.transparent,
                          suffixIcon: Icons.expand_more,
                          onTap: () {
                            showCustomDraggableBottomShhet(
                                context,
                                CustomeBottomSheetItem(
                                    headerText: 'Select customer',
                                    items: customerList));
                          },
                        ),
                      ),
                      const Width(w: 10),
                      const CustomServiceButton(
                        text: 'Add New',
                      )
                    ],
                  ),
                  CustomTextField(
                    controller: TextEditingController(text: 'NGN'),
                    title: 'Currency',
                    readOnly: true,
                    suffixIcon: Icons.expand_more,
                    borderColor: Colors.transparent,
                     onTap: () {
                      showCustomDraggableBottomShhet(
                        context,
                        CustomeBottomSheetItem(headerText: 'Select currency', items: currencyList)
                      );
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CustomTextField(
                              controller:
                                  TextEditingController(text: '1/6/2024'),
                              title: 'Date Created',
                              readOnly: true,
                              borderColor: Colors.transparent,
                              suffixIcon: Icons.calendar_month)),
                      const Width(w: 10),
                      Expanded(
                          child: CustomTextField(
                              controller:
                                  TextEditingController(text: '1/6/2024'),
                              title: 'Date Due',
                              readOnly: true,
                              borderColor: Colors.transparent,
                              suffixIcon: Icons.calendar_month)),
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
                    controller: TextEditingController(),
                    hasPadding: false,
                    title: 'Invoice Subject',
                    hintText: 'What\'s this invoice for?',
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                          child: CustomTextField(
                            readOnly: true,
                            borderColor: Colors.transparent,
                              controller: TextEditingController(text: 'Dart'),
                              title: 'Select Person',
                              suffixIcon: Icons.expand_more,
                              onTap: () {
                            showCustomDraggableBottomShhet(
                                context,
                                CustomeBottomSheetItem(
                                    headerText: 'Select person',
                                    items: customerList));
                          },
                              )),
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
                child: Column(
                  children: [
                    const SummaryWidget(name: 'Subtotal', value: '₦556,250'),
                    const Height(h: 10),
                    const SummaryWidget(name: 'Discount', value: '₦556,250'),
                    const Height(h: 10),
                    const SummaryWidget(name: 'Vat', value: '₦556,250'),
                    const Height(h: 10),
                    const SummaryWidget(name: 'Total', value: '₦556,250'),
                    const Height(h: 30),
                    CustomButton(onPressed: () {
                      showCustomDialog('You have successfully created your invoice', onTap: (){
                        removeAllAndPushScreen(AppRoute.dashboard);
                      },);
                    }, text: 'Create Invoice')
                  ],
                )),
          ],
        )),
      ),
    );
  }
}

class CustomeBottomSheetItem extends StatelessWidget {
  const CustomeBottomSheetItem(
      {super.key, required this.headerText, required this.items, this.canSearch = true});
  final List<String> items;
  final String headerText;
  final bool canSearch;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
          color: AppColors.kWhite,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.sp),
              topRight: Radius.circular(15.sp))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: headerText,
                color: AppColors.kBlack34,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ],
          ),
         if(canSearch) CustomTextField(
            hintText: 'Search...',
          ),
          ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 20.h),
              itemBuilder: (context, index) {
                final item = items[index];
                return InkWell(
                  onTap: () => popScreen(),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                    decoration: BoxDecoration(color: AppColors.kGreyF9),
                    child: CustomText(
                      text: item,
                      color: AppColors.kGrey47,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                    height: 20.h,
                  ),
              itemCount: items.length),
        ],
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
        CustomText(
          text: value,
          color: AppColors.kBlack4B,
        )
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

PreferredSize customAppBar({
  required String title,
  String? suffixText,
}) {
  return PreferredSize(
      preferredSize: Size.fromHeight(50.h),
      child: SafeArea(
        child: Container(
          height: 50.h,
          //color: Colors.red,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => popScreen(),
                child: Icon(Icons.navigate_before)),
              CustomText(text: title),
              suffixText != null
                  ? GestureDetector(
                      onTap: () => pushNamed(AppRoute.invoices),
                      child: CustomText(
                        text: suffixText,
                        color: AppColors.kPrimaryColor,
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ),
      ));
}
