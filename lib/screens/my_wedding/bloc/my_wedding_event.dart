part of 'my_wedding_bloc.dart';

sealed class MyWeddingEvent extends Equatable {
  const MyWeddingEvent();

  @override
  List<Object> get props => [];
}

class FetchEvent extends MyWeddingEvent {}
