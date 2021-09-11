//https://randomuser.me/api/?format=json&results=15&page=2&inc=gender,name,email,picture&nat=br

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {
  static const apiUrl = 'https://swapi.dev/api/';

  final dio = Dio()..options.baseUrl = apiUrl;

  Api() {
    dio.interceptors.add(
      InterceptorsWrapper(onRequest:
          (RequestOptions? options, RequestInterceptorHandler? handler) async {
        print('${options!.method} request to => ${options.path}');
        return handler!.next(options);
      }),
    );

    dio.interceptors.add(InterceptorsWrapper(onRequest:
        (RequestOptions options, RequestInterceptorHandler? handler) async {
      return handler!.next(options);
    }));

    dio.interceptors.add(
      InterceptorsWrapper(
          onError: (DioError? e, ErrorInterceptorHandler? handler) async {
        print("Deu erro aqui");
        if (e != null && e.response != null) {
          print(e.response!.data);
        }
        return handler!.resolve(e!.response!); //continue
      }),
    );
  }

  Future<Response> postDataTo(String endpoint, data) async {
    debugPrint('Api PostDataFrom =>($endpoint)');
    final response = await dio.post('$endpoint', data: data);

    return Future.value(response);
  }

  Future<Response> putDataTo(String endpoint, data) async {
    debugPrint('Api PutDataFrom =>($endpoint)');
    final response = await dio.put('$endpoint', data: data);

    return Future.value(response);
  }

  Future<dynamic> getDataFrom(String endpoint) async {
    var response;
    try {
      final url = '$endpoint';
      debugPrint('Api getDataFrom =>($url)');
      response = await dio.get(url);

      return Future.value(response);
    } catch (e) {
      print(e);
    }

    return null;
  }
}
