import 'dart:io';
import 'package:dio/dio.dart';
import 'package:finzefy_app/data/models/general/response.dart';
import 'package:finzefy_app/utils/app_string.dart';
import 'package:finzefy_app/utils/error_handler.dart';
import 'package:finzefy_app/utils/response_code.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
      baseUrl: '',
      connectTimeout: const Duration(seconds: 60),
      responseType: ResponseType.json,
      contentType: AppString.contentType));

  CancelToken cancelToken = CancelToken();

  ApiService() {
   // final pref = Provider.of<StorageController>(navigatorKey.currentContext!, listen: false);
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        
        options.headers["Accept"] = AppString.contentType;
        // String? accessToken = pref.getAccessToken();                                                                
        // options.headers[AppString.authorization] = "Bearer $accessToken";
        return handler.next(options);
      },
      // onError: (error, handler) async {
      //   if (error.response?.statusCode == 401) {
      //     navigatorKey.currentState?.pushNamedAndRemoveUntil(
      //         AppRoute.login, (Route<dynamic> route) => false);
      //   } else {
      //     return handler.next(error);
      //   }
      // },
    ));
  }

  Future<ResponseModel> getData({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    ResponseType? responseType,
    Map<String, dynamic>? body,
    bool isFormData = false,
  }) async {
    try {
      final data = isFormData ? FormData.fromMap(body!) : body;
      final response = await _dio.get(endpoint,
          queryParameters: queryParameters,
          data: data,
          cancelToken: cancelToken,
          options: Options(responseType: responseType));
      final responseModel = ResponseModel(isSuccess: true, data: response.data);
      return responseModel;
    } on DioException catch (e) {
      print(e.message);
      if (e.response != null) {
        print('failed ${e.response?.data}');
        String message = 'Something went wrong';
        bool ishtmlBody = e.response?.data
                .toString()
                .trimLeft()
                .startsWith('<!DOCTYPE html>') ??
            false;
        if (ishtmlBody) {
          message = e.response?.statusMessage ?? '';
        } else {
          message = e.response?.data['result']['message'];
        }

        final responseModel = ResponseModel(isSuccess: false, message: message);
        return responseModel;
      } else {
        print('it is exception issue $e' );
        final failure = dioExceptionHandler(e);
        final responseModel =
            ResponseModel(isSuccess: false, message: failure.responseMessage);
        return responseModel;
      }
    } on SocketException {
      print('it is a socket exception issue');
      final responseModel = ResponseModel(
          isSuccess: false, message: ResponseMessage.noInternetConnection);
      return responseModel;
    }
  }

  Future<ResponseModel> postData({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    bool isFormData = true,
    Map<String, dynamic>? body,
  }) async {
    try {
      final data = isFormData ? FormData.fromMap(body!) : body;
      final response = await _dio.post(endpoint,
          data: data,
          queryParameters: queryParameters,
          cancelToken: cancelToken);
          print(response.statusCode);
      final responseModel = ResponseModel(isSuccess: true, data: response.data);
      return responseModel;
    } on DioException catch (e) {
      if (e.response != null) {
        String message = 'Something went wrong';
        bool ishtmlBody = e.response?.data
                .toString()
                .trimLeft()
                .startsWith('<!DOCTYPE html>') ??
            false;
        if (ishtmlBody) {
          message = e.response?.statusMessage ?? '';
        } else {
          print(e.response?.data);
          message = e.response?.data['result']['message'];
        }

        final responseModel = ResponseModel(isSuccess: false, message: message);
        return responseModel;
      } else {
        print(e);
        final failure = dioExceptionHandler(e);
        final responseModel =
            ResponseModel(isSuccess: false, message: failure.responseMessage);
        return responseModel;
      }
    } on SocketException catch (e) {
      
      final responseModel = ResponseModel(
          isSuccess: false, message: ResponseMessage.noInternetConnection);
      return responseModel;
    }
  }

  Future<ResponseModel> putData({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    Map<String, dynamic>? body,
  }) async {
    try {
      final data = isFormData ? FormData.fromMap(body!) : body;
      final response = await _dio.put(endpoint,
          data: data,
          queryParameters: queryParameters,
          cancelToken: cancelToken);

      final responseModel = ResponseModel(isSuccess: true, data: response.data);
      return responseModel;
    } on DioException catch (e) {
      if (e.response != null) {
        String message = 'Something went wrong';
        bool ishtmlBody = e.response?.data
                .toString()
                .trimLeft()
                .startsWith('<!DOCTYPE html>') ??
            false;
        if (ishtmlBody) {
          message = e.response?.statusMessage ?? '';
        } else {
          message = e.response?.data['result']['message'];
        }

        final responseModel = ResponseModel(isSuccess: false, message: message);
        return responseModel;
      } else {
        final failure = dioExceptionHandler(e);
        final responseModel =
            ResponseModel(isSuccess: false, message: failure.responseMessage);
        return responseModel;
      }
    } on SocketException {
      final responseModel = ResponseModel(
          isSuccess: false, message: ResponseMessage.noInternetConnection);
      return responseModel;
    }
  }

  Future<ResponseModel> patchData({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    Map<String, dynamic>? body,
  }) async {
    try {
      final data = isFormData ? FormData.fromMap(body!) : body;
      final response = await _dio.patch(endpoint,
          data: data,
          queryParameters: queryParameters,
          cancelToken: cancelToken);

      final responseModel = ResponseModel(isSuccess: true, data: response.data);
      return responseModel;
    } on DioException catch (e) {
      if (e.response != null) {
        String message = 'Something went wrong';
        bool ishtmlBody = e.response?.data
                .toString()
                .trimLeft()
                .startsWith('<!DOCTYPE html>') ??
            false;
        if (ishtmlBody) {
          message = e.response?.statusMessage ?? '';
        } else {
          message = e.response?.data['result']['message'];
        }
        final responseModel = ResponseModel(isSuccess: false, message: message);
        return responseModel;
      } else {
        final failure = dioExceptionHandler(e);
        final responseModel =
            ResponseModel(isSuccess: false, message: failure.responseMessage);
        return responseModel;
      }
    } on SocketException {
      final responseModel = ResponseModel(
          isSuccess: false, message: ResponseMessage.noInternetConnection);
      return responseModel;
    }
  }

  Future<ResponseModel> deleteData({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    // required Map<String, dynamic> body,
  }) async {
    try {
      //final data = isFormData?FormData.fromMap(body): body;
      final response = await _dio.delete(endpoint,
          queryParameters: queryParameters, cancelToken: cancelToken);

      final responseModel = ResponseModel(isSuccess: true, data: response.data);
      return responseModel;
    } on DioException catch (e) {
      if (e.response != null) {
        String message = 'Something went wrong';
        bool ishtmlBody = e.response?.data
                .toString()
                .trimLeft()
                .startsWith('<!DOCTYPE html>') ??
            false;
        if (ishtmlBody) {
          message = e.response?.statusMessage ?? '';
        } else {
          message = e.response?.data['result']['message'];
        }

        final responseModel = ResponseModel(isSuccess: false, message: message);
        return responseModel;
      } else {
        final failure = dioExceptionHandler(e);
        final responseModel =
            ResponseModel(isSuccess: false, message: failure.responseMessage);
        return responseModel;
      }
    } on SocketException {
      final responseModel = ResponseModel(
          isSuccess: false, message: ResponseMessage.noInternetConnection);
      return responseModel;
    }
  }

  void cancelRequest() {
    if (!cancelToken.isCancelled) cancelToken.cancel();
  }
}
