import 'dart:async';

import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_task/contant/app_image.dart';
import 'package:job_task/contant/color.dart';
import 'package:job_task/screen/home/home.dart';
import 'package:job_task/screen/mediaLibrary/media_library.dart';
import 'package:job_task/screen/more/more.dart';
import 'package:job_task/screen/watch/watch.dart';

class BottomNavigationBars extends StatefulWidget {
  const BottomNavigationBars({super.key});

  @override
  State<BottomNavigationBars> createState() => _BottomNavigationBarsState();
}

class _BottomNavigationBarsState extends State<BottomNavigationBars> {
  Widget currentScreen = HomePage();
  int index = 0;
  final PageStorageBucket _bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return ConnectivityBuilder(builder: (context, isConnected, status) {
      return isConnected == true
          ? Scaffold(
              resizeToAvoidBottomInset: false,
              body: WillPopScope(
                onWillPop: () {
                  return Future.value(false);
                },
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior(),
                  child: GlowingOverscrollIndicator(
                    axisDirection: AxisDirection.down,
                    color: const Color(0xff675492),
                    child: PageStorage(
                      bucket: _bucket,
                      child: currentScreen,
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: BottomAppBar(
                elevation: 0,
                color: grey,
                shape: const CircularNotchedRectangle(),
                notchMargin: 0,
                child: Container(
                  height: 70.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: appColor,
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 0),
                            color: Colors.grey.shade400,
                            blurRadius: 5)
                      ]),
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22.0, right: 28),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              index = 0;
                              currentScreen = HomePage();
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppImage.more,
                                height: 25.h,
                                color:
                                    index == 0 ? white : white.withOpacity(0.6),
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Text(
                                'Dashboard',
                                style: TextStyle(
                                    color: index == 0
                                        ? white
                                        : white.withOpacity(0.6),
                                    fontSize: 12.sp),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              index = 1;
                              currentScreen = Watch();
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppImage.video,
                                height: 21.h,
                                color:
                                    index == 1 ? white : white.withOpacity(0.6),
                              ),
                              SizedBox(
                                height: 9.h,
                              ),
                              Text(
                                'Watch',
                                style: TextStyle(
                                    color: index == 1
                                        ? white
                                        : white.withOpacity(0.6),
                                    fontSize: 12.sp),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              index = 2;
                              currentScreen = MediaLibrary();
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppImage.file,
                                height: 21.h,
                                color:
                                    index == 2 ? white : white.withOpacity(0.6),
                              ),
                              SizedBox(
                                height: 9.h,
                              ),
                              Text(
                                'Media Library',
                                style: TextStyle(
                                    color: index == 2
                                        ? white
                                        : white.withOpacity(0.6),
                                    fontSize: 12.sp),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              index = 3;
                              currentScreen = More();
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppImage.menu,
                                height: 16.h,
                                color:
                                    index == 3 ? white : white.withOpacity(0.6),
                              ),
                              SizedBox(
                                height: 11.h,
                              ),
                              Text(
                                'More',
                                style: TextStyle(
                                    color: index == 3
                                        ? white
                                        : white.withOpacity(0.6),
                                    fontSize: 12.sp),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : Scaffold(
              body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text('Please check your internet connection!',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400)),
                    ),
                  ]),
            );
    });
  }
}
