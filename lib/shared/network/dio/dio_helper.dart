import 'dart:io';

import 'package:concaty_shop/shared/constant/constants.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class DioHelper
{
  static late Dio dio;
 static initial()
  {
    dio=Dio(
      BaseOptions(
        baseUrl: "https://student.valuxapps.com/api/",
        receiveDataWhenStatusError: true,


      )
    );
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate=(HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }
 static Future<Response> getData({
  required String url,
   Map<String,dynamic>? query,
   String? token,
})async
  {
dio.options.headers =
{
  "lang":"en",
  "Content-Type":"application/json",
  "Authorization":token

};
   return await dio.get(
       url,
       queryParameters: query
    );
  }
 static Future<Response> postData({
    required String url,
    required Map<String,dynamic> data
  })async
  {
    dio.options.headers=
    {
        "Content-Type":"application/json",
        "lang":"ar"

    };
   return await dio.post(url,data: data);
  }
}