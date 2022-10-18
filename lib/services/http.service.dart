import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:frontend_job_recruitment/environment.dart';

class HTTP {
  final PersistCookieJar pcj = PersistCookieJar();
  final Dio dio = Dio();
  final Map<String, String> headers = {
    "content-type": "text/json",
  };

  HTTP() {
    dio.interceptors.add(CookieManager(pcj));
    dio.options.baseUrl = apiUrl;
  }

  Future<Map<String, dynamic>> get(Uri uri) async {
    try {
      Response<String> resp = await dio.getUri(uri);
      Map<String, dynamic> data = json.decode(resp.data!);
      return data['data'];
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response!.requestOptions);
        return e.response!.data['error'];
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
        return {};
      }
    }
  }

  Future<Map<String, dynamic>> post(
    Uri uri,
    Map<String, dynamic> payload,
  ) async {
    try {
      Response<String> resp = await dio.postUri(uri, data: payload);
      Map<String, dynamic> data = json.decode(resp.data!);
      return data['data'];
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response!.requestOptions);
        return e.response!.data['error'];
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
        return {};
      }
    }
  }

  Future<Map<String, dynamic>> patch(
    Uri uri,
    Map<String, dynamic> payload,
  ) async {
    try {
      Response<String> resp = await dio.patchUri(uri, data: payload);
      Map<String, dynamic> data = json.decode(resp.data!);
      return data['data'];
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response!.requestOptions);
        return e.response!.data['error'];
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
        return {};
      }
    }
  }

  Future<Map<String, dynamic>> delete(Uri uri) async {
    try {
      Response<String> resp = await dio.deleteUri(uri);
      Map<String, dynamic> data = json.decode(resp.data!);
      return data['data'];
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response!.requestOptions);
        return e.response!.data['error'];
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
        return {};
      }
    }
  }
}
