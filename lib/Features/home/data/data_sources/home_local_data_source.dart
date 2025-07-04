import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeatureBooks();
  List<BookEntity> fetchNewestBooks();
}
class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeatureBooks() {

    return [];
  }

  @override
  List<BookEntity> fetchNewestBooks() {

    return [];
  }
}
