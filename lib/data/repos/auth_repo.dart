import 'package:finzefy_app/core/services/api_service.dart';
import 'package:finzefy_app/data/models/auth/email_model.dart';
import 'package:finzefy_app/data/models/auth/login_model.dart';
import 'package:finzefy_app/data/models/auth/sign_up_model.dart';
import 'package:finzefy_app/data/models/general/response.dart';

class AuthRepo {
  ApiService apiService;
  AuthRepo({required this.apiService});

  Future<ResponseModel> signUp(SignUpPayload signUpPayload) async {
    return await apiService.postData(
        endpoint: "", body: signUpPayload.toJson(),);

  }
 
 Future<ResponseModel> verifyEmail(VerifyEmailOtpPayload payload) async {
    return await apiService.postData(
        endpoint: "", body: payload.toJson(),);

  }

 Future<ResponseModel> login(LoginPayload payload) async {
    return await apiService.postData(
        endpoint: "", body: payload.toJson(),);

  }
}