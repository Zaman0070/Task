import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:job_task/contant/color.dart';

class DetailBox extends StatelessWidget {
  final String image;
  final String title;
  final String date;
  final Function() getTicket;
  final Function() getTrailer;

  const DetailBox(
      {super.key,
      required this.image,
      required this.title,
      required this.date,
      required this.getTicket,
      required this.getTrailer});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://image.tmdb.org/t/p/w500/$image',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.9),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'Watch',
                  style: TextStyle(
                      color: white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const Spacer(),
            Text(
                'In Theaters ${DateFormat.yMMMd().format(DateTime.parse(date))}',
                style: TextStyle(
                    color: white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500)),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55),
              child: InkWell(
                onTap: getTicket,
                child: Container(
                  height: 45.h,
                  decoration: BoxDecoration(
                    color: const Color(0xff61C3F2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Get Tickets',
                      style: TextStyle(
                          color: white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55),
              child: InkWell(
                onTap: getTrailer,
                child: Container(
                  height: 45.h,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: const Color(0xff61C3F2)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.play_arrow, color: white),
                      Text(
                        'Watch Trailer',
                        style: TextStyle(
                            color: white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 22.h,
            ),
          ],
        ),
      ),
    );
  }
}
