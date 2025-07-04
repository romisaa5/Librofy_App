class BookEntity {
  final String title;
  final String? image;
  final String genre;
  final String ?summary;
  final String ?autheName;
  final String bookId;

  BookEntity({
    required this.bookId,
    required this.title,
    required this.image,
    required this.genre,
    required this.summary,
    required this.autheName,
  });
}
