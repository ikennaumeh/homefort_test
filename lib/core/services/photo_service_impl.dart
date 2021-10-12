import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:homefort_test/core/helpers/helpers.dart';
import 'package:homefort_test/core/response_model/photo_model.dart';
import 'package:homefort_test/core/services/photo_service.dart';
import 'package:http/http.dart' as http;
class PhotoServiceImpl implements PhotoService{

  @override
  Future getPhotos() async{
    //url
    var url = "https://jsonplaceholder.typicode.com/photos";
    //get request
    try{
      final response = await http.get(Uri.parse(url));
        final String responseString = response.body;
        return photoModelFromJson(responseString);
    } on SocketException {
      throw AppResponse.showError("No internet");
    }
    on FormatException {}
    on HttpException {}

  }

}

class Failure {
  final String message;
  Failure(this.message);

  @override
  String toString() => message;

}