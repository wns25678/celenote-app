import 'package:json_annotation/json_annotation.dart';

part 'my_wedding_model.g.dart';

@JsonSerializable()
class MyWeddingModel {
  final int id;
  final int senderid;
  final int amount;
  final DateTime senderdate;

  MyWeddingModel({
    required this.id,
    required this.senderid,
    required this.amount,
    required this.senderdate,
  });

  factory MyWeddingModel.fromJson(Map<String, dynamic> json) =>
      _$MyWeddingModelFromJson(json);
  Map<String, dynamic> toJson() => _$MyWeddingModelToJson(this);
}
