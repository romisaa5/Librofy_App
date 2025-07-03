import 'package:flutter_bloc/flutter_bloc.dart';

class BookCubit extends Cubit<int> {
  BookCubit() : super(0);

  void next(int max) {
    if (state < max - 1) emit(state + 1);
  }

  void previous() {
    if (state > 0) emit(state - 1);
  }

  void setIndex(int index) {
    emit(index);
  }
}
