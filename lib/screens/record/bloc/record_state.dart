part of 'record_bloc.dart';

sealed class RecordState extends Equatable {
  const RecordState();

  @override
  List<Object> get props => [];
}

final class RecordInitial extends RecordState {}

class RecordLoading extends RecordState {}

class RecordLoaded extends RecordState {
  final List<RecordMessageModel> messages;

  const RecordLoaded({required this.messages});

  @override
  List<Object> get props => [messages];
}

class RecordError extends RecordState {
  final String message;

  const RecordError({required this.message});

  @override
  List<Object> get props => [message];
}
