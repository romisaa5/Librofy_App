import 'package:bookly_app/Features/home/data/models/book_model.dart';
import 'package:bookly_app/Features/home/presentation/widgets/book_card_item.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final BookModel book;
  final bool isActive;
  final bool isSmall;

  const BookCard({
    super.key,
    required this.book,
    this.isActive = false,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    final double width = isSmall ? 120 : 250;
    final double height = isSmall ? 160 : 350;
    final double radius = isSmall ? 12 : 20;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: isActive ? 0 : 20),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          if (!isSmall && isActive)
            BoxShadow(
              color: Colors.black.withValues(alpha: .5),
              blurRadius: 15,
              offset: Offset(0, 10),
            ),
        ],
      ),
      child: BookCardItem(book: book, isActive: isActive, isSmall: isSmall),
    );
  }
}
