import 'package:dio/dio.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
// ignore: unused_import
import 'package:get/get.dart' hide Response;

class Requests {
  static Future<Response> get(bool showLoader, String url,
      {String? params}) async {
    try {
      if (showLoader) {
        SmartDialog.showLoading(
          msg: "Please Wait...",
          backDismiss: false,
        );
      }
      //  String baseUrl = url;
      // String url = baseUrl;
      if (params != null) {
        url = "$url?$params";
      }
      Response response = await Dio().get(url);
      return response;
    } catch (e) {
      SmartDialog.dismiss();
      rethrow;
    }
  }
}
