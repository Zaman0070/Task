import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:job_task/contant/color.dart';
import 'package:job_task/screen/search/search_screen.dart';

class WatchAppBar extends StatefulWidget {
  final TextEditingController searchController;
  const WatchAppBar({super.key, required this.searchController});

  @override
  State<WatchAppBar> createState() => _WatchAppBarState();
}

class _WatchAppBarState extends State<WatchAppBar> {
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85.h,
      color: white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isSearch
                ? Container()
                : Text(
                    'Watch',
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: appColor,
                        fontWeight: FontWeight.w500),
                  ),
            isSearch
                ? Container(
                    height: 45.h,
                    width: 0.9.sw,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25), color: grey),
                    child: TextFormField(
                      controller: widget.searchController,
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
                : IconButton(
                    onPressed: () {
                      Get.to(() => SearchScreen());
                    },
                    icon: Icon(
                      Icons.search,
                      color: appColor,
                      size: 22.h,
                    )),
          ],
        ),
      ),
    );
  }
}
