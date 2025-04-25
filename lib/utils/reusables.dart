import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Height extends StatelessWidget {
 const Height({
    super.key,
    required this.h,
  });
 final double h;

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return SizedBox(height: h.h);
    // return SizedBox(height: h * size.height / 100);
  }
}

class Width extends StatelessWidget {
 const Width({
    super.key,
    required this.w,
  });
 final double w;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(width: w.w);
    // return SizedBox(width: w * size.width / 100);
  }
}