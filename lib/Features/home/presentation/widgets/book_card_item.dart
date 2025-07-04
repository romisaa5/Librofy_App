import 'package:bookly_app/Features/home/data/models/book_model/book_modl.dart';
import 'package:bookly_app/core/utils/app_colors.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookCardItem extends StatelessWidget {
  const BookCardItem({
    super.key,
    required this.book,
    required this.isActive,
    required this.isSmall,
  });
  final BookModel book;
  final bool isActive;
  final bool isSmall;
  @override
  @override
  Widget build(BuildContext context) {
    final double starSize = isSmall ? 12 : 14;
    final double radius = isSmall ? 12 : 20;
    final double width = isSmall ? 120 : 250;
    final double height = isSmall ? 160 : 350;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          GoRouter.of(context).push(AppRouter.bookDetailsView, extra: book);
        },
        borderRadius: BorderRadius.circular(radius),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: Image.asset(
                book.volumeInfo!.imageLinks?.thumbnail ?? '',
                fit: BoxFit.cover,
                width: width,
                height: height,
              ),
            ),
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.kprimaryColor.withValues(alpha: .8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.star,
                  color: Colors.amberAccent,
                  size: starSize,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
