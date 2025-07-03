import 'package:bookly_app/Features/home/data/models/book_model.dart';
import 'package:bookly_app/Features/home/presentation/widgets/book_card_item.dart';
import 'package:bookly_app/core/utils/text_styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimilarBooks extends StatelessWidget {
  final BookModel currentBook;
  const SimilarBooks({super.key, required this.currentBook});

  @override
  Widget build(BuildContext context) {
    final List<BookModel> similarBooks =
        BookModel.bookList
            .where(
              (movie) =>
                  movie.genre == currentBook.genre &&
                  movie.title != currentBook.title,
            )
            .take(4)
            .toList();
    final double gridHeight = similarBooks.length <= 2 ? 275.h : 550.h;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Text(
            'Similar',
            style: Styles.textStyle20.copyWith(color: Colors.black),
          ),
        ),
        SizedBox(
          height: gridHeight,
          child: GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: similarBooks.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return BookCardItem(
                isSmall: false,
                isActive: false,
                book: similarBooks[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
