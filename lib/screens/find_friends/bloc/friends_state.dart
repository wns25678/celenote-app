part of 'friends_bloc.dart';

sealed class FriendsState extends Equatable {
  const FriendsState();

  @override
  List<Object> get props => [];
}

final class FriendsInitial extends FriendsState {}

class FriendsLoading extends FriendsState {}

class FriendsLoaded extends FriendsState {
  final List<FriendModel> friends;

  const FriendsLoaded({required this.friends});

  @override
  List<Object> get props => [friends];
}

class FriendsError extends FriendsState {
  final String message;

  const FriendsError({required this.message});

  @override
  List<Object> get props => [message];
}
