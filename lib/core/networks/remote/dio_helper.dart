import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_constants.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      receiveDataWhenStatusError: true,
    ));

    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
  }

  static getData({
    required String url,
    query,
    data,
  }) async {
    return await dio.get(
      data: data,
      url,
      queryParameters: query,
    );
  }

  static postData({
    required String url,
    query,
    data,
  }) async {
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static patchData({
    required String url,
    query,
    data,
  }) async {
    return await dio.patch(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static deleteData({
    required String url,
    query,
    data,
  }) async {
    return await dio.delete(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static putData({
    required String url,
    query,
    required data,
    String lang = 'en',
  }) async {
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
