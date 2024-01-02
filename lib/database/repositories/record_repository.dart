import 'package:celenote_app/database/dummy.dart';
import 'package:celenote_app/database/models/record_message/record_message_model.dart';

class RecordRepository {
  RecordRepository();

  List<RecordMessageModel> readRecordMessages() {
    return Dummy.dummyRecordMessages;
  }
}
