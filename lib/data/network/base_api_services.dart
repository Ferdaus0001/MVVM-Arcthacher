abstract class BaseApiServices {

  Future<dynamic> getApiResponse(String rul);
  Future<dynamic> getPostApiResponse(String rul, dynamic data);
  // Future<dynamic> getPutApiResponse(String rul);
}