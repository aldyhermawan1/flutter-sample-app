import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../utils/extensions/string_ext.dart';
import 'exceptions/api_exception.dart';

errorHandler(dynamic error) {
  if (error is DioException) {
    DioException dioError = error;
    switch (dioError.type) {
      case DioExceptionType.badResponse:
        var error = dioError.response?.data;
        throw ApiException(
            error['responseDesc'], error['responseCode'].toString());
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw TimeoutException(dioError.error.toString());
      case DioExceptionType.badCertificate:
        throw CertificateException(dioError.error.toString());
      case DioException.connectionError:
        throw SocketException(dioError.error.toString());
      default:
        if (dioError.error is SocketException) {
          throw SocketException(dioError.error.toString());
        } else if (dioError.error is FormatException) {
          throw FormatException(dioError.error.toString());
        } else {
          throw ApiException(error.message.orEmpty(), '');
        }
    }
  } else {
    throw error;
  }
}
