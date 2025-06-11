import 'package:finzefy_app/config/route.dart';
import 'package:finzefy_app/utils/app_colors.dart';
import 'package:finzefy_app/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    // statusBarBrightness: Brightness.dark
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        title: 'Finzefy App',
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.kWhite,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.kWhite, scrolledUnderElevation: 0),
          useMaterial3: true,
        ),
        initialRoute: AppRoute.initial,
        onGenerateRoute: AppRoute.generateRoute,
      ),
    );
  }
}
