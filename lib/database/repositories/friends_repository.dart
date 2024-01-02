import 'package:celenote_app/database/dummy.dart';
import 'package:celenote_app/database/models/friend/friend_model.dart';

class FriendsRepository {
  FriendsRepository();

  List<FriendModel> readFriends() {
    return Dummy.dummyFriends;
  }
}
