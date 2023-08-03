import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:job_task/contant/color.dart';
import 'package:job_task/controller/watch_controller.dart';
import 'package:job_task/screen/detail_page/detail_page.dart';
import 'package:job_task/screen/search/widget/serch_box.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  var searchController = TextEditingController();

  WatchController watchController = Get.put(WatchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 85.h,
              color: white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 45.h,
                        width: 0.9.sw,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: grey),
                        child: TextFormField(
                          onChanged: (value) {
                            watchController.searchMovies(value);
                            watchController.search();
                          },
                          style: const TextStyle(color: black),
                          controller: searchController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 13.h),
                              border: InputBorder.none,
                              hintText: 'Tv Show, Movies and More',
                              hintStyle: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400),
                              prefixIcon: const Icon(
                                Icons.search,
                                color: appColor,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: const Icon(
                                  Icons.close,
                                  color: appColor,
                                ),
                              )),
                        ))
                  ],
                ),
              ),
            ),
            Expanded(
              child: Obx(() {
                final filteredMovies = watchController.searchList;
                return Container(
                  color: grey,
                  child: ListView.builder(
                      itemCount: filteredMovies.length,
                      itemBuilder: (context, index) {
                        final movie = filteredMovies[index];
                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: SearchBox(
                                title: movie.title.toString(),
                                image: movie.backdrop_path.toString(),
                                onTap: () {
                                  Get.to(
                                    () => DetailPage(movieList: movie),
                                  );
                                },
                                type: movie.original_title.toString()));
                      }),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
