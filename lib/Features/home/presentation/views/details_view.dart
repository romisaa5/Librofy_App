import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/widgets/similar_books.dart';
import 'package:bookly_app/Features/home/presentation/widgets/small_container_details.dart';
import 'package:bookly_app/Features/home/presentation/widgets/summary_section.dart';
import 'package:bookly_app/core/utils/app_colors.dart';
import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 10.h,
            children: [
              SizedBox(height: 20.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.white,
                ),
                height: 300.h,
                width: 220.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.asset(
                    book.volumeInfo?.imageLinks?.thumbnail ??
                        'assets/images/book.jpg',
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  book.volumeInfo!.title!,
                  style: Styles.textStyle26.copyWith(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 15.w,
                children: [
                  CustomButton(
                    textcolor: Colors.white,
                    isborder: false,
                    text: 'Free Preview',
                    color: AppColors.kprimaryColor,
                    width: MediaQuery.of(context).size.width * .4,
                  ),
                  CustomButton(
                    textcolor: Colors.white,
                    isborder: false,
                    text: 'Google Play',
                    color: AppColors.kprimaryColor,
                    width: MediaQuery.of(context).size.width * .4,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20.w,
                children: [
                  for (var item in [
                    {'value': 15, 'icon': Icons.favorite, 'color': Colors.red},
                    {
                      'value': 7.6,
                      'icon': Icons.star,
                      'color': Colors.amberAccent,
                    },
                  ])
                    SmallContainerDetails(
                      color: item['color'] as Color,
                      value: item['value'] as num,
                      icon: item['icon'] as IconData,
                    ),
                ],
              ),

              SimilarBooks(currentBook:  book),
              SummarySection(summary: book.volumeInfo!.authors.toString()),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
