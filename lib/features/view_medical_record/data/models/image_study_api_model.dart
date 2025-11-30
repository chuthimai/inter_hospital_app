import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/image_study.dart';

part 'image_study_api_model.g.dart';

@JsonSerializable()
class ImageStudyApiModel {
  final int id;
  final String endpoint;
  final DateTime? receivedTime;

  ImageStudyApiModel({
    required this.id,
    required this.endpoint,
    this.receivedTime,
  });

  factory ImageStudyApiModel.fromJson(Map<String, dynamic> json) =>
      _$ImageStudyApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageStudyApiModelToJson(this);

  /// Convert API model → Domain entity
  ImageStudy toEntity() => ImageStudy(
    id: id,
    endpoint: endpoint,
    receivedTime: receivedTime,
  );

  /// Convert Domain entity → API model
  factory ImageStudyApiModel.fromEntity(ImageStudy entity) =>
      ImageStudyApiModel(
        id: entity.id,
        endpoint: entity.endpoint,
        receivedTime: entity.receivedTime,
      );
}
