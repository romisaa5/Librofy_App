import 'package:bookly_app/Features/home/presentation/data/cubit/book_cubit.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const LibrofyApp());
}

class LibrofyApp extends StatelessWidget {
  const LibrofyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => BookCubit(),
          child: MaterialApp.router(
            theme: ThemeData().copyWith(scaffoldBackgroundColor: Colors.white),
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
          ),
        );
      },
    );
  }
}
