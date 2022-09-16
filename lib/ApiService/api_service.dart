import 'dart:convert';

import 'package:http/http.dart';
import 'package:untitled3/models/User.dart';

class ApiService {

  // HTTP Apis
  static Map<String, String> headers = {"Content-Type":"application/json; charset=UTF-8"};
  static String  GET_API = "/posts";
  static String BASE = "jsonplaceholder.typicode.com";

//  HTTP requests

  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params);
    var response = await get(uri);
    if(response.statusCode==200){
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api,Map<String,String> params) async{
    var uri = Uri.https(BASE,api,params);
    var response = await post(uri,headers: headers,body: jsonEncode(params));
    if(response.statusCode==200||response.statusCode==201){
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api,Map<String,String> params) async{
    var uri = Uri.https(BASE,api,params);
    var response = await put(uri,headers: headers,body: jsonEncode(params));
    if(response.statusCode==200){
      return response.body;
    }
    return null;
  }

  static Future<String?> DEL(String api,Map<String,String> params) async{
    var uri = Uri.https(BASE,api,params);
    var response = await delete(uri,headers: headers);
    if(response.statusCode==200){
      return response.body;
    }
    return null;
  }

//  HTTP params

  static Map<String, String> paramsEmpty(){
    Map<String, String> params = {};
    return params;
  }

  static Map<String, String> paramsPost(Post post){
    Map<String,String> params = {};
    params.addAll({
      'title': post.title,
      'body': post.body,
      'userId': post.userId.toString()
    });
    return params;
  }
}
