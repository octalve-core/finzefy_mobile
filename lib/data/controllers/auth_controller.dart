import 'package:finzefy_app/data/models/auth/login_model.dart';
import 'package:finzefy_app/data/models/auth/sign_up_model.dart';
import 'package:finzefy_app/data/models/general/response.dart';
import 'package:finzefy_app/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier{
  AuthRepo authRepo;
  AuthController({required this.authRepo});
  String selectedCurrency = 'NGN';
  void onCurrencySelected(String currencyName){
     selectedCurrency = currencyName;
     notifyListeners();
  }

  Future<ResponseModel> signUpUser(
    SignUpPayload payload
  ) async {

    final response = await authRepo.signUp(payload);
    if(response.isSuccess){
      String email = response.data['result']['data']['email'];
      final res = ResponseModel(isSuccess: true, data: email);
       return res;
    }else{
      return response;
    }
    
  }

  Future<ResponseModel> login(
    LoginPayload payload
  ) async {

    final response = await authRepo.login(payload);
    if(response.isSuccess){
      // String email = response.data['result']['data']['email'];
      // final res = ResponseModel(isSuccess: true, data: email);
      //  return res;
      
    }
      return response;
    
    
  }
}