import 'package:finzefy_app/presentation/screens/auth/business_details_screen.dart';
import 'package:finzefy_app/presentation/screens/auth/resetPassword/forgot_password_screen.dart';
import 'package:finzefy_app/presentation/screens/auth/login_screen.dart';
import 'package:finzefy_app/presentation/screens/auth/resetPassword/reset_password_otp_screen.dart';
import 'package:finzefy_app/presentation/screens/auth/set_new_password_screen.dart';
import 'package:finzefy_app/presentation/screens/auth/set_currency_screen.dart';
import 'package:finzefy_app/presentation/screens/auth/sign_up_screen.dart';
import 'package:finzefy_app/presentation/screens/auth/verify_email_screen.dart';
import 'package:finzefy_app/presentation/screens/bottomNav/home_screen.dart';
import 'package:finzefy_app/presentation/screens/customer/add_customer_screen.dart';
import 'package:finzefy_app/presentation/screens/onboard/onboard_screen.dart';
import 'package:finzefy_app/presentation/screens/onboard/splash_scrren.dart';
import 'package:finzefy_app/presentation/screens/services/invoice/create_invoice_screen.dart';
import 'package:finzefy_app/presentation/screens/services/invoice/invoices_screen.dart';
import 'package:flutter/material.dart';

class AppRoute{
  static const String initial = '/';
  static const String onboard = '/onboard';
  static const String signUp = '/signUp';
  static const String verifyEmailOtp = '/verifyEmailOtp';
  static const String businessInfo = '/businessInfo';
  static const String setCurrency = '/setCurrency';
  static const String login = '/login';
  static const String forgotPassword = '/forgotPassword';
  static const String forgotPasswordOtp = '/forgotPasswordOtp';
  static const String setNewPassword = '/setNewPassword';
  static const String dashboard = '/dashboard';
  static const String createInvoice = '/createInvoice';
  static const String invoices = '/invoices';
  static const String addCustomer = '/addCustomer';

    static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initial:
        return MaterialPageRoute(
            builder: (_) => const SplashScrren(), settings: settings);
      case onboard:
        return MaterialPageRoute(
            builder: (_) => const OnboardingScreen(), settings: settings);
      case signUp:
        return MaterialPageRoute(
            builder: (_) => const SignUpScreen(), settings: settings);   
      case verifyEmailOtp:
        return MaterialPageRoute(
            builder: (_) => const VerifyEmailScreen(), settings: settings);
     case businessInfo:
        return MaterialPageRoute(
            builder: (_) =>  const BusinessDetailsScreen(), settings: settings);     
     case setCurrency:
        return MaterialPageRoute(
            builder: (_) => const SetCurrencyScreen(), settings: settings);  
     case login:
        return MaterialPageRoute(
            builder: (_) => const LoginScreen(), settings: settings); 
     case forgotPassword:
        return MaterialPageRoute(
            builder: (_) => const ForgotPasswordScreen(), settings: settings);
     case forgotPasswordOtp:
        return MaterialPageRoute(
            builder: (_) => const ResetPasswordOtpScreen(), settings: settings);   
    case setNewPassword:
        return MaterialPageRoute(
            builder: (_) => const SetNewPasswordScreen(), settings: settings);                                                    
       case dashboard:
        return MaterialPageRoute(
            builder: (_) => const HomeScreen(), settings: settings); 
      case createInvoice:
        return MaterialPageRoute(
            builder: (_) => const CreateInvoiceScreen(), settings: settings); 
      case invoices:
        return MaterialPageRoute(
            builder: (_) => const InvoicesHistoryScreen(), settings: settings); 
      case addCustomer:
        return MaterialPageRoute(
            builder: (_) => const AddCustomerScreen(), settings: settings);                                  
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}