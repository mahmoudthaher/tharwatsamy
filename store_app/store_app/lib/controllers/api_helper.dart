import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiHelper {
  final String domain = "fakestoreapi.com";

  Future<String> getToken() async {
    var storage = const FlutterSecureStorage();
    bool exists = await storage.containsKey(key: "token");
    if (exists) {
      String result = await storage.read(key: "token") as String;
      return result;
    }
    return '';
  }

  Future<dynamic> getRequest({required String path}) async {
    Uri uriFunction = Uri.http(domain, path);
    var token = await getToken();
    var headers = {"Authorization": token}; //'Bearer $token'
    http.Response resposne = await http.get(uriFunction, headers: headers);
    return resposneFunction(resposne);
  }

  Future<dynamic> postRequest({required String path, required Map body}) async {
    Uri uriFunction = Uri.http(domain, path);
    var token = await getToken();
    var headers = {"Authorization": token};
    http.Response resposne =
        await http.post(uriFunction, body: body, headers: headers);
    return resposneFunction(resposne);
  }

  Future<dynamic> putRequest({required String path, required Map body}) async {
    Uri uriFunction = Uri.http(domain, path);
    var token = await getToken();
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    if (token != '') {
      headers.addAll({
        "Authorization": token,
      });
    }
    ;
    http.Response resposne =
        await http.put(uriFunction, body: body, headers: headers);
    return resposneFunction(resposne);
  }

  Future<dynamic> deleteRequest({required String path}) async {
    Uri uriFunction = Uri.http(domain, path);
    var token = await getToken();
    var headers = {"Authorization": token};
    http.Response resposne = await http.delete(uriFunction, headers: headers);
    return resposneFunction(resposne);
  }

  dynamic resposneFunction(http.Response resposne) {
    switch (resposne.statusCode) {
      case 200:
      case 201:
        dynamic jsonObject = jsonDecode(resposne.body);
        return jsonObject;
      case 400:
        throw "Bad Request";
      case 401:
        throw "Unauthrizied";
      case 402:
        throw "Payment Required";
      case 403:
        throw "Forbidden";
      case 404:
        throw "Not Found";
      case 500:
        throw "Server Error :(";
      default:
        throw "Server Error :(";
    }
  }
}
