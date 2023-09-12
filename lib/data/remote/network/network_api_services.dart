import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:babel_mate/data/remote/AppException.dart';
import 'package:babel_mate/data/remote/network/base_api_services.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 30));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException();
    } on RequestTomeOutException {
      throw RequestTomeOutException();
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  @override
  Future<dynamic> getApiWithHead(String url) async {
    dynamic responseJson;
    if (kDebugMode) {
      print(url);
    }

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Authorization':
            'w7e7OrQ30Ps1Rs2SRr7w1dkM4R96vY27KXuF9cp9NLVvjjuAAsGAVABKUYVx'
      }).timeout(Duration(seconds: 30));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException();
    } on RequestTomeOutException {
      throw RequestTomeOutException();
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  // for post api
  @override
  Future<dynamic> postApi(dynamic data, String url) async {
    dynamic responseJson;
    if (kDebugMode) {
      print(url);
      print(data);
    }
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException();
    } on RequestTomeOutException {
      throw RequestTomeOutException();
    }

    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  dynamic headers = {
    "Content-Type": "application/x-www-form-urlencoded",
    'Accept': 'application/json',
  };

  @override
  Future<dynamic> postMultipartRequest(
      String url, var data, File imageFile, String imageField) async {
    dynamic responseJson;

    // if (kDebugMode) {
    //   print(url);
    //   print(data);
    //   print(imageFile);
    //   print(imageField);
    // }

    // try {
    //   var request = http.MultipartRequest(
    //     "POST",
    //     Uri.parse(
    //       url,
    //     ),
    //   );

    //   request.headers.addAll(headers);

    //   var stream = http.ByteStream(imageFile!.openRead());
    //   stream.cast();
    //   var length = await imageFile!.length();

    //   var multipartFile = http.MultipartFile("profile_image", stream, length,
    //       filename: basename(imageFile!.absolute.path));

    //   request.files.add(multipartFile);
    //   request.fields.addAll(data);

    //   var response = await request.send().timeout(Duration(seconds: 20));

    //   responseJson = response;
    //   responseJson = returnMultipartResponse(response);
    // } on SocketException {
    //   throw InternetException('No Internet Connection');
    // }

    // print(responseJson);
    return responseJson;
  }

  @override
  Future<dynamic> postMultipartRequestWithoutImage(String url, var data) async {
    dynamic responseJson;

    if (kDebugMode) {
      print(url);
      print(data);
    }

    try {
      var request = http.MultipartRequest(
        "POST",
        Uri.parse(
          url,
        ),
      );

      request.fields.addAll(data);
      var response = await request.send().timeout(Duration(seconds: 20));

      responseJson = response;
      responseJson = returnMultipartResponse(response);
    } on SocketException {
      throw InternetException('No Internet Connection');
    }

    print(responseJson);
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw FetchDataException(
            'Something went wrong please try again later.');
      default:
        throw FetchDataException(
            'Error Occured while communicating with server ${response.statusCode}');
    }
  }

  // Response exception for images
  dynamic returnMultipartResponse(http.StreamedResponse response) async {
    final responseBody = await response.stream.bytesToString();
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(responseBody);
        return responseJson;
      case 400:
        throw FetchDataException(
            'Something went wrong please try again later.');
      default:
        throw FetchDataException(
            'Error accoured while communicating with server ${response.statusCode}');
    }
  }
}
