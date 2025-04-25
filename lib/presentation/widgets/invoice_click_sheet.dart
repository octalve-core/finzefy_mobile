// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:finzefy_app/presentation/widgets/custom_text.dart';
import 'package:finzefy_app/utils/app_colors.dart';
import 'package:finzefy_app/utils/image_constants.dart';
import 'package:finzefy_app/utils/reusables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class IncoiceClickOptionSheet extends StatefulWidget {
  //final Invoice invoice;
  const IncoiceClickOptionSheet({super.key, });

  @override
  State<IncoiceClickOptionSheet> createState() =>
      _IncoiceClickOptionSheetState();
}

class _IncoiceClickOptionSheetState extends State<IncoiceClickOptionSheet> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 65 * size.height / 100,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 1 * size.height / 100,
      ),
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Height(h: 20),
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.kSecondaryColor,
                child: SvgPicture.asset(
                  'assets/svgs/carticon.svg',
                  color: AppColors.kPrimaryColor,
                ),
              ),
              Width(w: 18),
              CustomText(
                text: 'FIZ-001',
                fontSize: 18,
                color: AppColors.kBlack28,
                fontWeight: FontWeight.w900,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ],
          ),
          Height(h: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InvoiceSheetTileThingy(
                img: kImages.eyesvg,
                txt: 'View Invoice',
                onTap: () {
                  
                },
              ),
              
              InvoiceSheetTileThingy(
                img: kImages.editsvg,
                txt: 'Edit Invoice',
                onTap: () {
                 
                },
              ),
              
              InvoiceSheetTileThingy(
                img: kImages.sendsvg,
                txt: 'Send Invoice',
                onTap: () {
                 
                },
              ),
              
              InvoiceSheetTileThingy(
                img: kImages.duplicatesvg,
                txt: 'Duplicate Invoice',
                onTap: () {
                 
                },
              ),
              
              InvoiceSheetTileThingy(
                img: kImages.binsvg,
                txt: 'Delete Invoice',
                onTap: () {
                },
              ),
              
              InvoiceSheetTileThingy(
                img: kImages.cirlechecksvg,
                txt: 'Mark as refunded',
                onTap: () {
                },
              ),
            ],
          ),
          Height(h: 20),
          
        ],
      ),
    );
  }
}

class InvoiceSheetTileThingy extends StatelessWidget {
  InvoiceSheetTileThingy({
    super.key,
    required this.onTap,
    required this.txt,
    required this.img,
    this.last,
  });
  String txt, img;
  Function() onTap;
  bool? last;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
                        splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10.h),
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10.w
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.kGreyF9,
          borderRadius: BorderRadius.circular(8.sp)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Width(w: 4),
                SvgPicture.asset(img),
                Width(w: 15),
                CustomText(
                  text: txt,
                  color: AppColors.kBlack28,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            Icon(Icons.navigate_next)
          ],
        ),
      ),
    );
  }
}
