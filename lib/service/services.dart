import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HttpServices {
  //initialize dio
  Dio? dio;
  HttpServices() {
    //instance
    dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));
    inspector();
  }

  Future<Response> getRequest(String endpoint) async {
    Response? res;
    try {
      res = await dio!.get(endpoint);
      if (res.statusCode == 200) {
        log('there response of the given endpoint ${endpoint} is ${res.data}');
      } else {
        log('response is null or empty');
      }
    } catch (e) {
      log(e.toString());
    }
    return res!;
  }

  Future<Response> postRequest(String endpoint,
      {required Map<String, dynamic> data}) async {
    Response? res;
    try {
      res = await dio!.post(endpoint);
      if (res.data == null) {
        log('response is null');
      } else {
        log('response is : ${jsonEncode(res.data)}');
      }
    } catch (e) {
      print(e);
    }
    return res!;
  }

  inspector() {
    dio!.interceptors.add(PrettyDioLogger(
      request: true,
      responseBody: true,
      requestBody: true,
    ));
  }
}
