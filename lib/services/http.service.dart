import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:frontend_job_recruitment/environment.dart';

class HTTP {
  final CookieJar cj = CookieJar();
  final Dio _dio = Dio();
  final Map<String, String> headers = {
    "content-type": "text/json",
  };

  HTTP() {
    _dio.interceptors.add(CookieManager(cj));
    _dio.options.baseUrl = apiUrl;
  }

  Future<Map<String, Object?>> get(Uri uri) async {
    try {
      print('Got here');
      Response<String> resp = await _dio.getUri(uri);
      Map<String, Object?> data = json.decode(resp.data!);
      print(data);
      return (data);
    } on DioError catch (e) {
      print(e);
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        throw e.response!.data['error'];
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        throw 'Internal Error';
      }
    }
  }

  Future<Map<String, Object?>> post(
    Uri uri,
    Map<String, Object?> payload,
  ) async {
    try {
      // Response<String> resp = await _dio.postUri(uri, data: payload);
      Response<String> resp = await _dio.postUri(uri, data: payload);
      Map<String, Object?> data = json.decode(resp.data!);
      print(data);
      return (data);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        throw e.response!.data['error'];
      } else {
        // Something happened in setting up or sending the request that triggered an Error]
        throw 'Internal Error';
      }
    }
  }

  Future<Map<String, Object?>> patch(
    Uri uri,
    Map<String, Object?> payload,
  ) async {
    try {
      Response<String> resp = await _dio.patchUri(uri, data: payload);
      Map<String, Object?> data = json.decode(resp.data!);
      print(data);
      return (data);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        throw e.response!.data['error'];
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        throw 'Internal Error';
      }
    }
  }

  Future<Map<String, Object?>> delete(Uri uri) async {
    try {
      Response<String> resp = await _dio.deleteUri(uri);
      Map<String, Object?> data = json.decode(resp.data!);
      print(data);
      return (data);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        throw e.response!.data['error'];
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        throw 'Internal Error';
      }
    }
  }
}
