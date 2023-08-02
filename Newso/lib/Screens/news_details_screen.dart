import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsDetailsScreen extends StatelessWidget {
  final String? publishedaT;
  final String? content;
  final String? newsimage;
  final String? newsauthor;
  final String? newstitle;
  final String? index;

  const NewsDetailsScreen(
      {super.key,
      this.publishedaT,
      this.content,
      this.newsimage,
      this.newsauthor,
      this.newstitle,
      this.index});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: 1.sw,
              height: 400.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(newsimage!),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 1.sw,
                height: 460.h,
                padding: EdgeInsets.only(
                    left: 15.w, right: 15.w, top: 88.h, bottom: 16.h),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.r),
                  ),
                ),
                child: SingleChildScrollView(
                  child: RichText(
                    text: TextSpan(
                      text: content,
                      style: GoogleFonts.nunito(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.w, -0.15.h),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                    height: 155.h,
                    width: 340.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16.r)),
                      backgroundBlendMode: BlendMode.luminosity,
                      color: Color(0xF5F5F580),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          publishedaT!,
                          style: GoogleFonts.nunito(
                              color: const Color(0xff2E0505),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        Text(
                          newstitle!,
                          style: TextStyle(
                              color: Color(0xff2E0505),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: "NewYorkSmall"),
                        ),
                        const Spacer(),
                        Text(
                          newsauthor!,
                          style: GoogleFonts.nunito(
                            color: const Color(0xff2E0505),
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(-0.9.w, -0.95.h),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 33.w,
                  height: 33.h,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}










/*

Align(
              alignment: const Alignment(-0.9, -0.95),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                    child: SvgPicture.asset(
                      color: Colors.white,
                      height: 33,
                      width: 33,
                      "assets/images/Group 26.svg",
                    ),
                  ),
                ),
              ),
            ),



 */