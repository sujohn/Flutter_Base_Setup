abstract class BaseApiService {

  final String baseUrl = "";

  Future<dynamic> getRequest(String url);
  Future<dynamic> postRequest(String url, dynamic params);
}