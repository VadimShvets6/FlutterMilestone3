// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageResponse _$ImageResponseFromJson(Map<String, dynamic> json) =>
    ImageResponse(
      results: (json['results'] as List<dynamic>)
          .map((e) => ImageAPI.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ImageResponseToJson(ImageResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

ImageAPI _$ImageAPIFromJson(Map<String, dynamic> json) => ImageAPI(
      id: json['id'] as int,
      imageUrl: json['main_image'] as String,
      nameDevice: json['name'] as String,
      description: json['details'] as String,
    );

Map<String, dynamic> _$ImageAPIToJson(ImageAPI instance) => <String, dynamic>{
      'id': instance.id,
      'main_image': instance.imageUrl,
      'name': instance.nameDevice,
      'details': instance.description,
    };
