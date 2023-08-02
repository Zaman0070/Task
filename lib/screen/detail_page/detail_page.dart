import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_task/contant/color.dart';
import 'package:job_task/model/watch_model.dart';
import 'package:job_task/screen/detail_page/widget/detail_box.dart';

class DetailPage extends StatelessWidget {
  final WatchModel movieList;
  const DetailPage({super.key, required this.movieList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailBox(
                getTicket: () {},
                getTrailer: () {},
                image: movieList.backdrop_path.toString(),
                title: movieList.title.toString(),
                date: movieList.release_date.toString(),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Genre',
                      style: TextStyle(
                          color: appColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff15D2BC),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 5),
                            child: Text(
                              'Action',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffE26CA5),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 5),
                            child: Text(
                              'Thriller',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff564CA3),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 5),
                            child: Text(
                              'Science',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffCD9D0F),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 5),
                            child: Text(
                              'Fiction',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Overview',
                      style: TextStyle(
                          color: appColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      movieList.overview.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: appColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
