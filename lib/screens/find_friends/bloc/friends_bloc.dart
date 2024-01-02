import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:celenote_app/database/models/friend/friend_model.dart';
import 'package:celenote_app/database/repositories/friends_repository.dart';

part 'friends_event.dart';
part 'friends_state.dart';

class FriendsBloc extends Bloc<FriendsEvent, FriendsState> {
  FriendsBloc() : super(FriendsInitial()) {
    on<FriendsEvent>((event, emit) {
      emit(FriendsLoading());
      try {
        final List<FriendModel> friends = FriendsRepository().readFriends();
        emit(
          FriendsLoaded(
            friends: friends,
          ),
        );
      } catch (e) {
        emit(
          const FriendsError(message: 'Failed to fetch.'),
        );
      }
    });
  }
}
