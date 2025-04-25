import 'package:finzefy_app/presentation/screens/auth/business_details_screen.dart';
import 'package:finzefy_app/presentation/screens/auth/forgot_password_screen.dart';
import 'package:finzefy_app/presentation/screens/auth/login_screen.dart';
import 'package:finzefy_app/presentation/screens/auth/set_new_password_screen.dart';
import 'package:finzefy_app/presentation/screens/auth/set_urrency_screen.dart';
import 'package:finzefy_app/presentation/screens/auth/sign_up_screen.dart';
import 'package:finzefy_app/presentation/screens/auth/verify_email_screen.dart';
import 'package:finzefy_app/presentation/screens/bottomNav/home_screen.dart';
import 'package:finzefy_app/presentation/screens/onboard/onboard_screen.dart';
import 'package:finzefy_app/presentation/screens/services/invoice/create_invoice_screen.dart';
import 'package:finzefy_app/presentation/screens/services/invoice/invoices_screen.dart';
import 'package:finzefy_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
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
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.kWhite.withOpacity(0.97),
          appBarTheme:const AppBarTheme(
            backgroundColor: AppColors.kWhite,
            scrolledUnderElevation: 0
          ),
          useMaterial3: true,
        ),
        home:  CreateInvoiceScreen(),
      ),
    );
  }
}
