import 'package:finzefy_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SplashScrren extends StatefulWidget {
  const SplashScrren({super.key});

  @override
  State<SplashScrren> createState() => _SplashScrrenState();
}

class _SplashScrrenState extends State<SplashScrren> with SingleTickerProviderStateMixin{
 final scale  = Tween<double>(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.easeInOut));
 late AnimationController controller;

 void nextScreen() async{
  Future.delayed(const Duration(seconds: 2)).then((_){

  });
 }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   controller  = AnimationController(vsync: this, duration:const Duration(seconds: 1));
   controller.forward();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: Center(
        child: ScaleTransition(
          scale: scale.animate(controller),
          child: Image.asset('assets/images/app-logo.png', width: 200,)),
      ),
    );
  }
}