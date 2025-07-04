import 'package:bookly_app/core/utils/app_colors.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> sliddingAnimation;
  void navigateToHome() {
    Future.delayed(Duration(seconds: 4), () {
      if (!mounted) return;
      GoRouter.of(context).push(AppRouter.onboardingView1);
    });
  }

  void initSliddingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    sliddingAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );
    animationController.forward();
  }

  @override
  void initState() {
    initSliddingAnimation();
    super.initState();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
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
          SlideTransition(
            position: sliddingAnimation,
            child: Center(
              child: Text(
                'Dive into a world of books',
                style: Styles.textStyle14,
              ),
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
