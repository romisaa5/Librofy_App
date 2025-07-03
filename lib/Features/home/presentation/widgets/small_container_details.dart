import 'package:bookly_app/core/utils/app_colors.dart';
import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallContainerDetails extends StatelessWidget {
  const SmallContainerDetails({
    super.key,
    required this.value,
    required this.icon, required this.color,
  });
  final num value;
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.h,
      height: 40.w,
      decoration: BoxDecoration(
        color: AppColors.lightPurple,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        spacing: 5.w,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Text(
            value.toString(),
            style: Styles.textStyle18.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
