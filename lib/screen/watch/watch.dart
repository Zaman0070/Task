import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:job_task/contant/color.dart';
import 'package:job_task/controller/watch_controller.dart';
import 'package:job_task/model/watch_model.dart';
import 'package:job_task/screen/detail_page/detail_page.dart';
import 'package:job_task/screen/watch/widget/app_bar.dart';
import 'package:job_task/screen/watch/widget/watch_box.dart';

class Watch extends StatelessWidget {
  Watch({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: grey,
      body: SafeArea(
        child: Column(
          children: [
            WatchAppBar(
              searchController: _searchController,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  GetBuilder<WatchController>(
                      init: WatchController(),
                      builder: (controller) {
                        Orientation orientation =
                            MediaQuery.of(context).orientation;
                        return Container(
                          color: grey,
                          height: orientation == Orientation.landscape
                              ? 127.h
                              : 470.h,
                          child: GridView.builder(
                            itemCount: controller.watchList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 10.h,
                                    crossAxisSpacing: 10.w,
                                    crossAxisCount: 2,
                                    mainAxisExtent: 100.h),
                            itemBuilder: (context, index) {
                              WatchModel movieList =
                                  controller.watchList[index];
                              return WatchBox(
                                  onTap: () {
                                    Get.to(
                                      () => DetailPage(
                                        movieList: movieList,
                                      ),
                                    );
                                  },
                                  image: movieList.backdrop_path.toString(),
                                  title: movieList.title.toString());
                            },
                          ),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
