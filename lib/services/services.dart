import 'package:dio/dio.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:job_task/contant/api/request.dart';
import 'package:job_task/model/watch_model.dart';

class Services {
  Future<List<WatchModel>> getList() async {
    List<WatchModel> allList = [];
    try {
      Response response = await Requests.get(
          true, 'https://api.themoviedb.org/3/movie/upcoming',
          params: 'api_key=163258633a4f8a9b8e151a0e8de054ac');
      for (var element in response.data['results']) {
        allList.add(WatchModel.fromMap(element));
        SmartDialog.dismiss;
      }
    } catch (e) {
      SmartDialog.dismiss;
    }
    return allList;
  }

  Future<List<WatchModel>> searchList(String query) async {
    List<WatchModel> allList = [];
    try {
      Response response = await Requests.get(
          true, 'https://api.themoviedb.org/3/search/movie',
          params: 'api_key=163258633a4f8a9b8e151a0e8de054ac&query=$query');
      for (var element in response.data['results']) {
        allList.add(WatchModel.fromMap(element));
        SmartDialog.dismiss;
      }
    } catch (e) {
      SmartDialog.dismiss;
      print(e);
    }
    return allList;
  }
}
