// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_wedding_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyWeddingModel _$MyWeddingModelFromJson(Map<String, dynamic> json) =>
    MyWeddingModel(
      id: json['id'] as int,
      senderid: json['senderid'] as int,
      amount: json['amount'] as int,
      senderdate: DateTime.parse(json['senderdate'] as String),
    );

Map<String, dynamic> _$MyWeddingModelToJson(MyWeddingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderid': instance.senderid,
      'amount': instance.amount,
      'senderdate': instance.senderdate.toIso8601String(),
    };
