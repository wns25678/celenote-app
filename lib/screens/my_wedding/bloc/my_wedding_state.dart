part of 'my_wedding_bloc.dart';

sealed class MyWeddingState extends Equatable {
  const MyWeddingState();

  @override
  List<Object> get props => [];
}

final class MyWeddingInitial extends MyWeddingState {}

class MyWeddingLoading extends MyWeddingState {}

class MyWeddingLoaded extends MyWeddingState {
  final List<MyWeddingModel> mywedding;

  const MyWeddingLoaded({required this.mywedding});

  @override
  List<Object> get props => [mywedding];
}

class MyWeddingError extends MyWeddingState {
  final String message;

  const MyWeddingError({required this.message});

  @override
  List<Object> get props => [message];
}
