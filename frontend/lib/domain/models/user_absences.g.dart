// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_absences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAbscenceImpl _$$UserAbscenceImplFromJson(Map<String, dynamic> json) =>
    _$UserAbscenceImpl(
      crewId: json['crewId'] as int,
      id: json['id'] as int,
      userId: json['userId'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      startDate: DateTime.parse(json['startDate'] as String),
      type: UserAbscenceTypeExtension.fromString(json['type'] as String),
      memberNote: json['memberNote'] as String? ?? '',
      admitterNote: json['admitterNote'] as String? ?? '',
      confirmedAt: _dateFromJson(json['confirmedAt'] as String?),
      rejectedAt: json['rejectedAt'] as String?,
      admitterId: json['admitterId'] as int?,
    );

Map<String, dynamic> _$$UserAbscenceImplToJson(_$UserAbscenceImpl instance) =>
    <String, dynamic>{
      'crewId': instance.crewId,
      'id': instance.id,
      'userId': instance.userId,
      'createdAt': instance.createdAt.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'startDate': instance.startDate.toIso8601String(),
      'type': _$UserAbscenceTypeEnumMap[instance.type]!,
      'memberNote': instance.memberNote,
      'admitterNote': instance.admitterNote,
      'confirmedAt': instance.confirmedAt?.toIso8601String(),
      'rejectedAt': instance.rejectedAt,
      'admitterId': instance.admitterId,
    };

const _$UserAbscenceTypeEnumMap = {
  UserAbscenceType.sickness: 'sickness',
  UserAbscenceType.vacation: 'vacation',
};
