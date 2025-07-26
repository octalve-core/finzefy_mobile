import 'package:bot_toast/bot_toast.dart';
import 'package:finzefy_app/core/route.dart';
import 'package:finzefy_app/core/services/api_service.dart';
import 'package:finzefy_app/data/controllers/auth_controller.dart';
import 'package:finzefy_app/data/controllers/business_controller.dart';
import 'package:finzefy_app/data/repos/auth_repo.dart';
import 'package:finzefy_app/data/repos/business_repo.dart';
import 'package:finzefy_app/utils/app_colors.dart';
import 'package:finzefy_app/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    // statusBarBrightness: Brightness.dark
  ));
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (context) =>
              AuthController(authRepo: AuthRepo(apiService: ApiService()))),
     ChangeNotifierProvider(
          create: (context) =>
              BusinessController(businessRepo: BusinessRepo(apiService: ApiService())))         
    ],
    child: const MyApp(),
  ));
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
        builder: BotToastInit(),
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
