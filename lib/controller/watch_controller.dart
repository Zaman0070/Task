import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart' hide Response;
import 'package:job_task/model/watch_model.dart';
import 'package:job_task/services/services.dart';

class WatchController extends GetxController {
  var watchList = <WatchModel>[].obs;
  var searchText = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    await getList();
  }

  Future<void> getList() async {
    watchList.value = await Services().getList();
    update();
    SmartDialog.dismiss();
  }

  void searchMovies(String query) {
    searchText.value = query;
  }

  List<WatchModel> get filteredMovies {
    return watchList
        .where((movie) =>
            movie.title!.toLowerCase().contains(searchText.value.toLowerCase()))
        .toList();
  }
}
