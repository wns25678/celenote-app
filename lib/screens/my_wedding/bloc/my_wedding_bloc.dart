import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:celenote_app/database/models/my_wedding/my_wedding_model.dart';
import 'package:celenote_app/database/repositories/my_wedding_repository.dart';

part 'my_wedding_event.dart';
part 'my_wedding_state.dart';

class MyWeddingBloc extends Bloc<MyWeddingEvent, MyWeddingState> {
  MyWeddingBloc() : super(MyWeddingInitial()) {
    on<MyWeddingEvent>((event, emit) {
      emit(MyWeddingLoading());
      try {
        final List<MyWeddingModel> mywedding =
            MyWeddingRepository().readMyWedding();
        emit(
          MyWeddingLoaded(
            mywedding: mywedding,
          ),
        );
      } catch (e) {
        emit(
          const MyWeddingError(message: 'Failed to fetch.'),
        );
      }
    });
  }
}
