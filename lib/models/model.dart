import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class PostModel extends Equatable {
  final int? id;
  final int? userId;
  final String? title;
  final String? body;

  PostModel(
      {required this.id,
      required this.userId,
      required this.title,
      required this.body});

  @override
  List<Object?> get props => [id, userId, title, body];

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);
  
  Map<String,dynamic> toJson()=> _$PostModelToJson(this);
}
