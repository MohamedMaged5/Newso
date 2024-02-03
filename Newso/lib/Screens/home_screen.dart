import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Data/Cubits/AllNews/all_news_cubit.dart';
import 'news_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchcon = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<AllNewsCubit>().getallnews("");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        floatingActionButton: FloatingActionButton.small(
          backgroundColor: Colors.black54,
          onPressed: () {
            context.read<AllNewsCubit>().getallnews("");
            searchcon.text = "";
          },
          child: Icon(
            Icons.refresh,
            size: 26.sp,
            color: Colors.white,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: Column(
            children: [
              SizedBox(
                height: 17.h,
              ),
              SizedBox(
                height: 40,
                child: TextFormField(
                  controller: searchcon,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.search,
                      size: 20.sp,
                      color: Colors.black,
                    ),
                    hintText: "Search..",
                    hintStyle: GoogleFonts.nunito(
                        fontSize: 13.sp, fontWeight: FontWeight.w600),
                  ),
                  onFieldSubmitted: (value) {
                    context.read<AllNewsCubit>().getallnews(value);
                  },
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Latest News",
                style: TextStyle(
                  fontFamily: "NewYorkSmall",
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Expanded(
                child: BlocBuilder<AllNewsCubit, AllNewsState>(
                  builder: (context, state) {
                    if (state is AllNewsLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    } else if (state is AllNewsSuccess) {
                      return ListView.builder(
                        itemCount: state.ourresponse.articles!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewsDetailsScreen(
                                    newsimage: state
                                        .ourresponse.articles![index].urlToImage
                                        .toString(),
                                    publishedaT: state.ourresponse
                                        .articles![index].publishedAt
                                        .toString(),
                                    newstitle: state
                                        .ourresponse.articles![index].title
                                        .toString(),
                                    newsauthor: state
                                        .ourresponse.articles![index].author
                                        .toString(),
                                    content: state
                                        .ourresponse.articles![index].content
                                        .toString(),
                                    index: state.ourresponse.articles![index]
                                        .toString(),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 15.h),
                              padding: const EdgeInsets.all(16),
                              height: 200.h,
                              width: 1.sw,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16.r)),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(state
                                      .ourresponse.articles![index].urlToImage
                                      .toString()),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Spacer(),
                                  Text(
                                    "By : ${state.ourresponse.articles![index].author.toString()}",
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                    style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 12.sp,
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                            color: Colors.black,
                                            blurRadius: 6.r),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    state.ourresponse.articles![index].title
                                        .toString(),
                                    softWrap: true,
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                      fontFamily: "NewYorkSmall",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16.sp,
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                            color: Colors.black,
                                            blurRadius: 6.r),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    height: 50.h,
                                    child: Text(
                                      state.ourresponse.articles![index]
                                          .description
                                          .toString(),
                                      softWrap: true,
                                      overflow: TextOverflow.fade,
                                      style: GoogleFonts.nunito(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          shadows: [
                                            Shadow(
                                                color: Colors.black,
                                                blurRadius: 4.5.r),
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Text(
                          "Check your Internet Connection",
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.sp),
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
