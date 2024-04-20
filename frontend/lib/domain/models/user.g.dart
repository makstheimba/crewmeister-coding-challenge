// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      crewId: json['crewId'] as int,
      id: json['id'] as int,
      image: json['image'] as String,
      name: json['name'] as String,
      userId: json['userId'] as int,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'crewId': instance.crewId,
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'userId': instance.userId,
    };
