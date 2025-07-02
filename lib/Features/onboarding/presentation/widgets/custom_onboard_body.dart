import 'package:bookly_app/core/utils/app_colors.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomOnboardBody extends StatelessWidget {
  const CustomOnboardBody({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    required this.buttonName,
    this.onTap,
    required this.currentIndex,
  });
  final int currentIndex;
  final String image;
  final String title;
  final String desc;
  final String buttonName;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          spacing: 15.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            TextButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.loginView);
              },
              child: Text(
                'Skip',
                style: Styles.textStyle16.copyWith(
                  color: AppColors.kprimaryColor,
                ),
              ),
            ),
            Center(child: Image.asset(image)),
            Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: Styles.textStyle26,
                textAlign: TextAlign.center,
              ),
            ),
            Text(desc, style: Styles.textStyle14, textAlign: TextAlign.center),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    width: 10.w,
                    height: 10.w,
                    decoration: BoxDecoration(
                      color:
                          currentIndex == index
                              ? AppColors.kprimaryColor
                              : Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
            ),
            CustomButton(
              onTap: onTap,
              text: buttonName,
              color: AppColors.kprimaryColor,
              width: double.infinity,
            ),
            CustomButton(
              onTap: () {
                GoRouter.of(context).go(AppRouter.loginView);
              },
              isborder: false,
              text: 'Sign in',
              textcolor: AppColors.kprimaryColor,
              color: AppColors.lightPurple,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
