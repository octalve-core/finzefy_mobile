import 'dart:math';

import 'package:finzefy_app/presentation/widgets/custom_text.dart';
import 'package:finzefy_app/utils/app_colors.dart';
import 'package:finzefy_app/utils/reusables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showLoadingDialog(BuildContext context){
  showDialog(context: context, builder: (context){
    return const ThreeDotsAnimation();
  });
}


class LoadingMoreIndicator extends StatelessWidget {
  const LoadingMoreIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 15.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            radius: 8.r,
                            backgroundColor: AppColors.kWhite,
                            child: CircularProgressIndicator(
                              color: AppColors.kPrimaryColor,
                              strokeWidth: 3.0.sp,
                            )),
                        const Height(h: 8),
                        const CustomText(text: 'loading...', color: AppColors.kPrimaryColor,)
                       
                      ],
                    ),
                  ),
                );
  }
}


class ThreeDotsAnimation extends StatefulWidget {
  const ThreeDotsAnimation({super.key});

  @override
  State<ThreeDotsAnimation> createState() => _ThreeDotsAnimationState();
}

class _ThreeDotsAnimationState extends State<ThreeDotsAnimation> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _radiusAnimation;
  late final Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _radiusAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 20.0).chain(CurveTween(curve: Curves.easeOut)), weight: 30),
      TweenSequenceItem(tween: ConstantTween(20.0), weight: 40),
      TweenSequenceItem(tween: Tween(begin: 20.0, end: 0.0).chain(CurveTween(curve: Curves.easeIn)), weight: 30),
    ]).animate(_controller);

    _rotationAnimation = Tween<double>(begin: 0, end: 2 * pi).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Transform.rotate(
          angle: _rotationAnimation.value,
          child: SizedBox(
            width: 100,
            height: 100,
            child: Stack(
              alignment: Alignment.center,
              children: [
                _buildDot(angle: 0),
                _buildDot(angle: 2 * pi / 3),
                _buildDot(angle: 4 * pi / 3),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDot({required double angle}) {
    final offset = Offset(
      _radiusAnimation.value * cos(angle),
      _radiusAnimation.value * sin(angle),
    );
    return Transform.translate(
      offset: offset,
      child: Container(
        width: 12,
        height: 12,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
