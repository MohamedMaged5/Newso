import 'package:flutter/material.dart';
import 'package:news_app/Screens/Splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Data/Cubits/AllNews/all_news_cubit.dart';

void main() {
  runApp(const Newso());
}

class Newso extends StatelessWidget {
  const Newso({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(392.7, 872.7),
      minTextAdapt: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AllNewsCubit>(
              create: (BuildContext context) => AllNewsCubit(),
            ),
          ],
          child: MaterialApp(
            theme: ThemeData(primarySwatch: Colors.grey),
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          ),
        );
      },
    );
  }
}
