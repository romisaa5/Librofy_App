import 'package:bookly_app/Features/home/data/models/book_model.dart';
import 'package:bookly_app/Features/home/presentation/data/cubit/book_cubit.dart';
import 'package:bookly_app/Features/home/presentation/widgets/book_card.dart';
import 'package:bookly_app/Features/home/presentation/widgets/book_category_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final PageController _pageController = PageController(viewportFraction: 0.7);
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final books = BookModel.bookList;

    return Scaffold(
      body: KeyboardListener(
        focusNode: _focusNode,
        autofocus: true,
        onKeyEvent: (event) {
          if (event is KeyDownEvent) {
            final cubit = context.read<BookCubit>();
            if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
              cubit.next(books.length);
              _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
              cubit.previous();
              _pageController.previousPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          }
        },
        child: BlocBuilder<BookCubit, int>(
          builder: (context, currentIndex) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        child: Container(
                          key: ValueKey<String>(books[currentIndex].image),
                          height: MediaQuery.of(context).size.height * .60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(books[currentIndex].image),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                Colors.black.withValues(alpha: .5),
                                BlendMode.darken,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SafeArea(
                        child: Column(
                          children: [
                            SizedBox(height: 10.h),
                            Center(
                              child: Image.asset(
                                'assets/images/available_now.png',
                                height: 80.h,
                              ),
                            ),
                            SizedBox(
                              height: 300,
                              child: PageView.builder(
                                controller: _pageController,
                                itemCount: books.length,
                                onPageChanged: (index) {
                                  context.read<BookCubit>().setIndex(index);
                                },
                                itemBuilder: (context, index) {
                                  final isActive = index == currentIndex;
                                  return AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: isActive ? 0 : 10,
                                    ),
                                    child: BookCard(
                                      book: books[index],
                                      isActive: index == currentIndex,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  BookCategorySection(
                    title: 'Self-help',
                    books:
                        BookModel.bookList
                            .where((m) => m.genre == 'Self-help')
                            .toList(),
                    onSeeMore: () {},
                  ),
                  BookCategorySection(
                    title: 'Science Fiction',
                    books:
                        BookModel.bookList
                            .where((m) => m.genre == 'Science Fiction')
                            .toList(),
                    onSeeMore: () {},
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
