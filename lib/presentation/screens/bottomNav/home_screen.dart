import 'package:finzefy_app/config/route.dart';
import 'package:finzefy_app/presentation/widgets/custom_text.dart';
import 'package:finzefy_app/presentation/widgets/invoice_click_sheet.dart';
import 'package:finzefy_app/utils/app_colors.dart';
import 'package:finzefy_app/utils/nav.dart';
import 'package:finzefy_app/utils/reusables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  final int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<String> tabText = ['Dashboard', 'Getting Started'];
    final w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.h),
          child: Container(
            height: 100.h,
            color: AppColors.kPrimaryColor,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/dp.png',
                        height: 40,
                      ),
                      const Width(w: 10),
                      const Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'Good Afternoon,',
                            color: AppColors.kWhite,
                            fontWeight: FontWeight.w300,
                          ),
                          CustomText(
                            text: 'Abdussamad',
                            color: AppColors.kWhite,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      )
                    ],
                  ),
                  const Badge(
                    backgroundColor: Colors.red,
                    child: Icon(
                      Icons.notifications_none,
                      color: AppColors.kWhite,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),
          )),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        //  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40.h,
                    margin: EdgeInsets.only(bottom: 20.w),
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.kGreyF9,
                      borderRadius: BorderRadius.circular(10.r),
                      // border: Border.all(color: AppColors.kPrimaryColor)
                    ),
                    child: Stack(
                      children: [
                        AnimatedAlign(
                          alignment: tabIndex == 0
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          duration: const Duration(milliseconds: 300),
                          child: Container(
                            height: 30.h,
                            width: 140.w,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                color: AppColors.kPrimaryColor,
                                borderRadius: BorderRadius.circular(10.sp)),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            2,
                            (index) => GestureDetector(
                              onTap: () => null,
                              child: Center(
                                child: Container(
                                  height: 26.h,
                                  width: 140.w,
                                  alignment: Alignment.center,
                                  child: CustomText(
                                      text: tabText[index],
                                      fontSize: 13,
                                      color: index == 0
                                          ? AppColors.kWhite
                                          : AppColors.kBlack2D,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const CustomText(
                    text: 'Welcome Abdussamad',
                    color: AppColors.kGrey900,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                  const CustomText(
                    text: 'Here`s your business`s overview',
                    color: AppColors.kGrey600,
                    fontSize: 11,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                    decoration: BoxDecoration(
                        color: AppColors.kWhite,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          text: 'Quick Create',
                          color: AppColors.kBlack34,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        Height(h: 20.h),
                        Wrap(
                            spacing: MediaQuery.sizeOf(context).width *0.08,
                            runSpacing: 10.h,
                           // alignment: WrapAlignment.spaceBetween,
                            children: [
                              QuickCreateWidget(
                                imgName: 'invoice',
                                name: 'Invoice',
                                onTap: () => pushNamed(AppRoute.createInvoice),
                              ),
                              QuickCreateWidget(
                                imgName: 'users',
                                name: 'Customer',
                                onTap: () => pushNamed(AppRoute.addCustomer),
                              ),
                              QuickCreateWidget(
                                imgName: 'invoice',
                                name: 'Expenses',
                                onTap: () => pushNamed(AppRoute.createInvoice),
                              ),
                              QuickCreateWidget(
                                imgName: 'invoice',
                                name: 'Quaotation',
                                onTap: () => pushNamed(AppRoute.createInvoice),
                              ),
                            ])
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15.sp),
                    decoration: BoxDecoration(
                        color: AppColors.kWhite,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          text: 'View your receivable summary',
                          color: AppColors.kGrey900,
                          fontSize: 22,
                        ),
                        const Height(h: 5),
                        const CustomText(
                          text: 'Your current sales summary and activity',
                          color: AppColors.kGrey600,
                          fontSize: 15,
                        ),
                        Container(
                          color: AppColors.kWhite,
                          child: ExpansionTile(
                            shape: Border.all(color: Colors.transparent),
                            tilePadding: EdgeInsets.zero,
                            showTrailingIcon: false,
                            title: Padding(
                              padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: 'Total Receivables',
                                        color: AppColors.kBlack34,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      CustomText(
                                        text: 'NGN 500,000.00',
                                        color: AppColors.kBlack34,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ],
                                  ),
                                  CircleAvatar(
                                      radius: 15.r,
                                      backgroundColor:
                                          AppColors.kLightPrimaryColor,
                                      child: const Icon(
                                        Icons.expand_more,
                                        color: AppColors.kPrimaryColor,
                                      )),
                                ],
                              ),
                            ),
                            children: [
                             // const CustomText(text: 'text')
                              ],
                          ),
                        ),
                        const Row(
                          children: [
                            Expanded(
                                child: SummaryWidget(
                                    text: 'Current Invoice',
                                    value: '506,0000.00')),
                            Width(w: 10),
                            Expanded(
                                child: SummaryWidget(
                                    text: 'Total Inflow', value: '506,0000.00'))
                          ],
                        ),
                        const Height(h: 10),
                        const Row(
                          children: [
                            Expanded(
                                child: SummaryWidget(
                              text: 'Overdue Invoice',
                              value: '506,0000.00',
                              color: AppColors.kRed,
                            )),
                            Width(w: 10),
                            Expanded(
                                child: SummaryWidget(
                              text: 'Total Outflow',
                              value: '506,0000.00',
                              color: AppColors.kRed,
                            ))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                  top: 20.h, bottom: 15.h, left: 10.w, right: 10.w),
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                  color: AppColors.kWhite,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.sp),
                      topRight: Radius.circular(12.sp))),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Recent transactions',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomText(
                    text: 'View all',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.kPrimaryColor,
                  ),
                ],
              ),
            ),
          ),
          SliverList.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ServiceTile(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25.0)),
                      ),
                      builder: (BuildContext context) {
                        return IncoiceClickOptionSheet();
                      },
                    );
                  },
                );
              })
        ],
      ),
    );
  }
}

/*  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: 'Recent transactions', fontSize: 18, fontWeight: FontWeight.w600,),
              CustomText(text: 'View all', fontSize: 18, fontWeight: FontWeight.w600,),
            ],
          ),
          */
class ServiceTile extends StatelessWidget {
  const ServiceTile({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 10.w,
        ),
        padding: EdgeInsets.only(
          left: 10.w,
          right: 10.w,
          bottom: 10.h,
        ),
        color: AppColors.kWhite,
        child: Container(
          // margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 4.w),
          decoration: BoxDecoration(
              color: AppColors.kGreyF9,
              borderRadius: BorderRadius.circular(10.r)),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.kLightYellow,
                child: SvgPicture.asset('assets/svgs/file-icon.svg'),
              ),
              const Width(w: 10),
              SizedBox(
                width: w * 0.35,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      text: 'Olamide Ismail',
                      color: AppColors.kBlack4B,
                      fontWeight: FontWeight.w600,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 6.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                      //alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.kWhite,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: const CustomText(
                        text: 'FZ: 00001INV',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: AppColors.kBlack28,
                      ),
                    ),
                    const CustomText(
                        text: 'Created: 12/6/2024',
                        textOverflow: TextOverflow.ellipsis)
                  ],
                ),
              ),
              const Width(w: 10),
              SizedBox(
                width: w * 0.25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const CustomText(
                      text: '₦120,000.00',
                      color: AppColors.kBlack4B,
                      fontWeight: FontWeight.w600,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 6.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                      //alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.kLightYellow,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: const CustomText(
                        text: 'Pending',
                        maxLines: 1,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: AppColors.kYellow,
                      ),
                    ),
                    const CustomText(
                        text: 'Created: 12/6/2024',
                        textOverflow: TextOverflow.ellipsis)
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
              const Icon(
                Icons.more_vert,
                size: 30,
                color: AppColors.kGrey400,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SummaryWidget extends StatelessWidget {
  const SummaryWidget(
      {super.key, required this.text, required this.value, this.color});
  final String text;
  final String value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(color: AppColors.kGrey200)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: text,
            fontSize: 12,
            fontWeight: FontWeight.w300,
            color: color ?? AppColors.kPrimaryColor,
          ),
          CustomText(
            text: '₦$value',
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.kGrey900,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}

class QuickCreateWidget extends StatelessWidget {
  const QuickCreateWidget(
      {super.key,
      required this.imgName,
      required this.name,
      required this.onTap});
  final String imgName;
  final String name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 25.r,
            backgroundColor: AppColors.kLightPrimaryColor,
            child: SvgPicture.asset(
              'assets/svgs/$imgName.svg',
              height: 20.h,
              width: 20.w,
            ),
          ),
          const Height(h: 10),
          const CustomText(
            text: 'New',
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
          CustomText(
            text: name,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ],
      ),
    );
  }
}
