import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_task/contant/color.dart';

class SearchBox extends StatelessWidget {
  final String title;
  final String image;
  final Function() onTap;
  final String type;
  const SearchBox(
      {super.key,
      required this.title,
      required this.image,
      required this.onTap,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 90.h,
                  width: 160.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          NetworkImage('https://image.tmdb.org/t/p/w500$image'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 120.w,
                      child: Text(title,
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: appColor,
                              fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 120.w,
                      child: Text(type,
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400)),
                    ),
                  ],
                ),
              ],
            ),
            const Icon(
              Icons.more_horiz,
              color: Color(0xff61C3F2),
            )
          ],
        ),
      ),
    );
  }
}
