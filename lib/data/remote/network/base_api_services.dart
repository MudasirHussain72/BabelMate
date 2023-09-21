import 'dart:io';

abstract class BaseApiServices {
  Future<dynamic> getApi(String url);

  Future<dynamic> postApi(dynamic data, String url);

  Future<dynamic>  postMultipartRequest(String url, dynamic data, File  imageFile, String imageField);

  Future<dynamic> postMultipartRequestWithoutImage(String url, var data);

  Future<dynamic> getApiWithHead(String url);

}