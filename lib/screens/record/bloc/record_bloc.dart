import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:celenote_app/database/models/record_message/record_message_model.dart';
import 'package:celenote_app/database/repositories/record_repository.dart';

part 'record_event.dart';
part 'record_state.dart';

class RecordBloc extends Bloc<RecordEvent, RecordState> {
  RecordBloc() : super(RecordInitial()) {
    on<RecordEvent>((event, emit) {
      emit(RecordLoading());
      try {
        final List<RecordMessageModel> messages =
            RecordRepository().readRecordMessages();
        emit(
          RecordLoaded(
            messages: messages,
          ),
        );
      } catch (e) {
        emit(
          const RecordError(message: 'Failed to fetch.'),
        );
      }
    });
  }
}
