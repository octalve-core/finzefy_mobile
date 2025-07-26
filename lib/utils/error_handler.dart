import 'package:dio/dio.dart';
import 'package:finzefy_app/data/models/general/failure_model.dart';
import 'package:finzefy_app/utils/response_code.dart';
Failure dioExceptionHandler(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return Failure(
          responseMessage: ResponseMessage.connectionTimeout,
          responseCode: ResponseCode.connectionTimeout);
    case DioExceptionType.sendTimeout:
      return Failure(
          responseMessage: ResponseMessage.sendTimeout,
          responseCode: ResponseCode.sendTimeout);
    case DioExceptionType.connectionError:
      return Failure(
          responseMessage: ResponseMessage.connectionError,
          responseCode: ResponseCode.noInternetConnection);
    case DioExceptionType.receiveTimeout:
      return Failure(
          responseMessage: ResponseMessage.receiveTimeout,
          responseCode: ResponseCode.receiveTimeout);
    case DioExceptionType.cancel:
      return Failure(
          responseMessage: ResponseMessage.cancel,
          responseCode: ResponseCode.cancel);
    default:
      return Failure(responseMessage: "Something went wrong", responseCode: 0);
  }
}
