import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/core/utils/api_services.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeatureBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiServices apiServices;

  HomeRemoteDataSourceImpl({required this.apiServices});
  @override
  Future<List<BookEntity>> fetchFeatureBooks() async {
    var data = await apiServices.get(
      'volumes?Filtering=free-ebooks&q=programming',
    );
    List<BookEntity> books = getBooks(data);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiServices.get(
      'volumes?Filtering=free-ebooks&q=programming&Sorting=newest',
    );
    List<BookEntity> books = getBooks(data);
    return books;
  }

  List<BookEntity> getBooks(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      try {
        books.add(BookModel.fromJson(bookMap));
      } catch (e) {}
    }
    return books;
  }
}
