
// class SignUpResponseModel {
//   String? message;
//   Data? data;

//   SignUpResponseModel({this.message, this.data});

//   SignUpResponseModel.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['message'] = message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   User? user;
//   String? token;
//   String? biometricToken;

//   Data({this.user, this.token, this.biometricToken});

//   Data.fromJson(Map<String, dynamic> json) {
//     user = json['user'] != null ? new User.fromJson(json['user']) : null;
//     token = json['token'];
//     biometricToken = json['biometric_token'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (user != null) {
//       data['user'] = user!.toJson();
//     }
//     data['token'] = token;
//     data['biometric_token'] = biometricToken;
//     return data;
//   }
// }
