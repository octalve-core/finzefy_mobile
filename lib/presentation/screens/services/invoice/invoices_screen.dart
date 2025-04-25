import 'package:finzefy_app/presentation/screens/bottomNav/home_screen.dart';
import 'package:finzefy_app/presentation/widgets/custom_text.dart';
import 'package:finzefy_app/utils/app_colors.dart';
import 'package:finzefy_app/utils/reusables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvoicesHistoryScreen extends StatelessWidget {
  const InvoicesHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> filters = [
      'All',
      'Paid',
      'Unpaid',
      'Overdue',
      'Draft',
      'Refunded'
    ];
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      appBar: AppBar(),
      floatingActionButton: CircleAvatar(
        backgroundColor: AppColors.kPrimaryColor,
        radius: 25.r,
        child: Icon(Icons.add, color: AppColors.kWhite, size: 30.sp,),
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 70.h,
            child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColors.kGreyAE.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10.sp)),
                    child: CustomText(text: filters[index], color: AppColors.kGreyAE,),
                  );
                },
                separatorBuilder: (context, index) => Width(w: 10),
                itemCount: filters.length),
          ),

          Expanded(child: ListView.builder(
            physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric( vertical: 20.h),
            itemBuilder: (context, index){
            return ServiceTile();
          },  itemCount: 20))
        ],
      )),
    );
  }
}
