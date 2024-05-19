// ignore: file_names
abstract class  BaseApiServices{

  Future<dynamic> getGetApiResponse(String url);

  Future<dynamic> getPostApiAuthResponse(String url,dynamic data);

  Future<dynamic> getPostApiResponse(String url,dynamic data);

}