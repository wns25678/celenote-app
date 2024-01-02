import 'package:json_annotation/json_annotation.dart';

part 'record_message_model.g.dart';

@JsonSerializable()
class RecordMessageModel {
  final int id;
  final int senderid;
  final int recipientid;
  final String message;
  final String? imagepath;
  final DateTime senderDate;

  RecordMessageModel({
    required this.id,
    required this.senderid,
    required this.recipientid,
    required this.message,
    this.imagepath,
    required this.senderDate,
  });

  factory RecordMessageModel.fromJson(Map<String, dynamic> json) =>
      _$RecordMessageModelFromJson(json);
  Map<String, dynamic> toJson() => _$RecordMessageModelToJson(this);
}
