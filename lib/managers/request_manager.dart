import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_base_setup/managers/app_exceptions.dart';
import 'package:flutter_base_setup/managers/base_api_service.dart';

class ApiRequestManager extends BaseApiService {

  @override
  Future getRequest(String url) async {

    dynamic responsJson;

    try {

      final response = await http.get(Uri.parse('$baseUrl+$url'));

      responsJson = responseHandler(response);

    } on SocketException {
      throw Exception('No Internet Connection');
    }
    return responsJson;
  }
  
  @override
  Future postRequest(String url, params) async {
    
    dynamic responsJson;

    try {
      
      final response = await http.post(
        Uri.parse('$baseUrl+$url'), 
        body: jsonEncode(params), 
        headers: {'Content-Type':'application/json'});

        responsJson = responseHandler(response);

    } on SocketException {
      throw Exception('No Internet Connection');
    }
    return responsJson;
  }

/*
  static const String baseUrl = 'http://api.alquran.cloud/v1/surah/';

  static Future<dynamic> getRequest(String endpoint) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl$endpoint'));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch(e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }

  static Future<dynamic> postRequest(String endpoint, dynamic body) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$endpoint'), 
        body: jsonEncode(body), 
        headers: {'Content-Type':'application/json'});

        if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }
*/
  dynamic responseHandler(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnAuthorisedException(response.body.toString());
      case 404:
        throw ResourceNotFoundException(response.body.toString());
      case 500:
        throw InternalServerException(response.body.toString());
      default:
        throw FetchDataException('Error occured while communication with server' + ' with status code: ${response.statusCode}');
    }
  }

  // Add other HTTP request methods as needed: PUT, DELETE, etc.
}