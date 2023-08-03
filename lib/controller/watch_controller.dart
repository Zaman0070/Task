import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart' hide Response;
import 'package:job_task/model/watch_model.dart';
import 'package:job_task/services/services.dart';

class WatchController extends GetxController {
  var watchList = <WatchModel>[].obs;
  var searchList = <WatchModel>[].obs;
  var searchText = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    await getList();
    // await search();
  }

  Future<void> getList() async {
    watchList.value = await Services().getList();
    update();
    SmartDialog.dismiss();
  }

  Future<void> search() async {
    searchList.value = await Services().searchList(
      searchText.value,
    );
    update();
    SmartDialog.dismiss();
  }

  void searchMovies(String query) {
    searchText.value = query;
  }
}
