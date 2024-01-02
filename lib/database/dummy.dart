import 'package:celenote_app/database/models/friend/friend_model.dart';
import 'package:celenote_app/database/models/my_wedding/my_wedding_model.dart';
import 'package:celenote_app/database/models/record_message/record_message_model.dart';

class Dummy {
  static final dummyFriends = [
    FriendModel(id: 0, name: '박범준'),
    FriendModel(id: 1, name: '이준석'),
    FriendModel(id: 2, name: '전용범'),
    FriendModel(id: 3, name: '조주봉'),
    FriendModel(id: 4, name: '홍박사'),
  ];

  static final dummyRecordMessages = [
    RecordMessageModel(
      id: 0,
      senderid: 0,
      recipientid: 1,
      message: '100,000',
      senderDate: DateTime.now(),
    ),
    RecordMessageModel(
      id: 1,
      senderid: 1,
      recipientid: 0,
      message: '50,000',
      senderDate: DateTime.now().add(const Duration(days: 1)),
    ),
    RecordMessageModel(
      id: 2,
      senderid: 0,
      recipientid: 1,
      message: '10,000,000',
      imagepath: 'assets/images/test.png',
      senderDate: DateTime.now().add(const Duration(days: 2)),
    ),
  ];

  static final dummyMyWedding = [
    MyWeddingModel(
      id: 0,
      senderid: 0,
      amount: 50000,
      senderdate: DateTime.now().add(const Duration(days: 1)),
    ),
    MyWeddingModel(
      id: 1,
      senderid: 1,
      amount: 50000,
      senderdate: DateTime.now().add(const Duration(days: 2)),
    ),
    MyWeddingModel(
      id: 2,
      senderid: 2,
      amount: 50000,
      senderdate: DateTime.now().add(const Duration(days: 3)),
    ),
    MyWeddingModel(
      id: 3,
      senderid: 3,
      amount: 50000,
      senderdate: DateTime.now().add(const Duration(days: 4)),
    ),
    MyWeddingModel(
      id: 4,
      senderid: 4,
      amount: 50000,
      senderdate: DateTime.now().add(const Duration(days: 5)),
    ),
  ];
}
