import 'package:json_annotation/json_annotation.dart';

part 'image_api.g.dart';

@JsonSerializable()
class ImageResponse {
  @JsonKey(name: 'results')
  List<ImageAPI> results;

  ImageResponse({required this.results});

  factory ImageResponse.fromJson(Map<String, dynamic> json) => _$ImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ImageResponseToJson(this);
}

@JsonSerializable()
class ImageAPI {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'main_image')
  final String imageUrl;
  @JsonKey(name: "name")
  final String nameDevice;
  @JsonKey(name: "details")
  final String description;

  ImageAPI({required this.id, required this.imageUrl, required this.nameDevice, required this.description});

  factory ImageAPI.fromJson(Map<String, dynamic> json) => _$ImageAPIFromJson(json);

  Map<String, dynamic> toJson() => _$ImageAPIToJson(this);
}
