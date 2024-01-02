// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordMessageModel _$RecordMessageModelFromJson(Map<String, dynamic> json) =>
    RecordMessageModel(
      id: json['id'] as int,
      senderid: json['senderid'] as int,
      recipientid: json['recipientid'] as int,
      message: json['message'] as String,
      imagepath: json['imagepath'] as String?,
      senderDate: DateTime.parse(json['senderDate'] as String),
    );

Map<String, dynamic> _$RecordMessageModelToJson(RecordMessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderid': instance.senderid,
      'recipientid': instance.recipientid,
      'message': instance.message,
      'imagepath': instance.imagepath,
      'senderDate': instance.senderDate.toIso8601String(),
    };
