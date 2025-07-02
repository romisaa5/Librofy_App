import 'package:bookly_app/core/utils/app_colors.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void navigateToHome() {
    Future.delayed(Duration(seconds: 5), () {
      if (!mounted) return;
      GoRouter.of(context).push(AppRouter.onboardingView1);
    });
  }

  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kprimaryColor,
      body: Stack(
        children: [
          Positioned(
            top: 300.h,
            right: 125.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 15.w,
              children: [
                Image.asset('assets/images/logo.png'),
                Text(
                  'Librofy',
                  style: Styles.textStyle24.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(0, 0.05),
            child: Text(
              'Dive into a world of books',
              style: Styles.textStyle14,
            ),
          ),
          Positioned(
            left: -10,
            bottom: 0,
            child: Image.asset('assets/images/Vector.png'),
          ),
        ],
      ),
    );
  }
}
