import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

class HTTP {
  final PersistCookieJar pcj = PersistCookieJar();
  final Dio dio = Dio();
  final Map<String, String> headers = {
    "content-type": "text/json",
  };

  HTTP() {
    dio.interceptors.add(CookieManager(pcj));
  }

  Future<Map<String, dynamic>> get(Uri uri) async {
    Response<String> resp = await dio.getUri(uri);
    Map<String, dynamic> data = json.decode(resp.data!);
    return data;
  }

  Future<Map<String, dynamic>> post(Uri uri, Map<String, dynamic> payload) async {
    Response<String> resp = await dio.postUri(uri, data: payload);
    Map<String, dynamic> data = json.decode(resp.data!);
    return data;
  }

  Future<Map<String, dynamic>> patch(Uri uri, Map<String, dynamic> payload) async {
    Response<String> resp = await dio.patchUri(uri, data: payload);
    Map<String, dynamic> data = json.decode(resp.data!);
    return data;
  }

  Future<Map<String, dynamic>> delete(Uri uri) async {
    Response<String> resp = await dio.deleteUri(uri);
    Map<String, dynamic> data = json.decode(resp.data!);
    return data;
  }
}