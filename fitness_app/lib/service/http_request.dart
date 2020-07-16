import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:fitness_app/service/config.dart';

Future request(url, {formData}) async{
  try {
    print('start to request data');
    Response res;
    Dio dio = new Dio();
    dio.options.contentType = Headers.formUrlEncodedContentType;
    // var formData = {'lon': '115.02932','lat': '35.76189'};
    if(formData == null){
      res = await dio.get(des[url],);
    }else {
      res = await dio.post(des[url], data: formData,);
    }
    
    if(res.statusCode == 200) {
      return res.data;
    } else {
      throw Exception("Backend API error");
    }
  } catch(e) {
    print("ERROR=>$e");
  }
}