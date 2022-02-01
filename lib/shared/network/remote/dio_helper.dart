import 'dart:io';

import 'package:dio/dio.dart';

class DioHelper
{
  static late Dio dio;

  static init()
  {
     dio = Dio(
        BaseOptions(
          baseUrl: "https://cazariye.com/api/",
          receiveDataWhenStatusError: true,
          headers: {HttpHeaders.userAgentHeader: 'dio', 'Content-TypeContent-Type': 'application/json'},

       ),
    );

  }
  Future<Response> getData({
  required String url,
  required  Map<String, dynamic> query,
    String lang = 'ar',
    String? token ,
}) async
  {
    dio.options.headers = {HttpHeaders.userAgentHeader: 'dio',
      'lang': lang,
      'Authorization': token,
    };
    return await   dio.get(url, queryParameters: query,);
  }

 static Future<Response> postData({
  required String url,
  Map<String, dynamic>? query,
  required  Map<String, dynamic> data,
   String lang = 'ar',
   String? token ,
}) async
  {
    dio.options.headers = {HttpHeaders.userAgentHeader: 'dio',
      'lang': lang,
      'Authorization': token,
    };
    return await   dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }


}