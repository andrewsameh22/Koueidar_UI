import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../app_router/routes.dart';
import '../app_strings/app_strings.dart';

BuildContext? context =
    AppRouter.router.routerDelegate.navigatorKey.currentContext;

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(AppStrings.connectionTimeOut);
      case DioExceptionType.sendTimeout:
        return ServerFailure(AppStrings.sendTimeOut);
      case DioExceptionType.receiveTimeout:
        return ServerFailure(AppStrings.receiveTimeOut);
      case DioExceptionType.badCertificate:
        return ServerFailure(AppStrings.badCer);
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(e.response!.statusCode!, e.response!);
      case DioExceptionType.cancel:
        return ServerFailure(AppStrings.requestCancelled);
      case DioExceptionType.connectionError:
        return ServerFailure(AppStrings.noInternetConnection);
      case DioExceptionType.unknown:
        return ServerFailure(AppStrings.oppsThereWasAnError);
    }
  }

  factory ServerFailure.fromResponse(int statusCode,
      Response<dynamic>? response) {
    if (response == null) {
      return ServerFailure(AppStrings.somethingWentWrong);
    }

    if (statusCode == 500) {
      return ServerFailure(AppStrings.serverProblem);
    } else if (statusCode >= 400 && statusCode <= 404) {
      try {
        final data = response.data;
        if (data is Map<String, dynamic>) {
          if (data.containsKey('message') && data.containsKey('success')) {
            final message = data['message'].toString();
            final success = data['success'] as bool;
            if (success == false) {
              return ServerFailure(message);
            }
          }
        }
        return ServerFailure(AppStrings.somethingWentWrong);
      } catch (e) {
        return ServerFailure(AppStrings.somethingWentWrong);
      }
    } else {
      return ServerFailure(AppStrings.somethingWentWrong);
    }
  }
}
