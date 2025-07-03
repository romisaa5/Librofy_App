import 'package:bookly_app/Features/home/data/models/book_model.dart';
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
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(
                  book.image,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.6,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.6,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: .3),
                        Colors.black.withValues(alpha: .5),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  bottom: 20,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        book.title,
                        style: Styles.textStyle32,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10.h,
                children: [
                  CustomButton(
                    textcolor: Colors.white,
                    isborder: false,
                    text: 'Watch',
                    color: AppColors.kprimaryColor,
                    width: double.infinity,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 20.w,
                    children: [
                      for (var item in [
                        {
                          'value': 15,
                          'icon': Icons.favorite,
                          'color': Colors.red,
                        },
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

                  SimilarBooks(currentBook: book),
                  SummarySection(summary: book.summary),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
