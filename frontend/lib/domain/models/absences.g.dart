// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'absences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AbsenceImpl _$$AbsenceImplFromJson(Map<String, dynamic> json) =>
    _$AbsenceImpl(
      crewId: json['crewId'] as int,
      id: json['id'] as int,
      userId: json['userId'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      startDate: DateTime.parse(json['startDate'] as String),
      type: AbsenceTypeExtension.fromString(json['type'] as String),
      memberNote: json['memberNote'] as String? ?? '',
      admitterNote: json['admitterNote'] as String? ?? '',
      confirmedAt: _dateFromJson(json['confirmedAt'] as String?),
      rejectedAt: json['rejectedAt'] as String?,
      admitterId: json['admitterId'] as int?,
    );

Map<String, dynamic> _$$AbsenceImplToJson(_$AbsenceImpl instance) =>
    <String, dynamic>{
      'crewId': instance.crewId,
      'id': instance.id,
      'userId': instance.userId,
      'createdAt': instance.createdAt.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'startDate': instance.startDate.toIso8601String(),
      'type': _$AbsenceTypeEnumMap[instance.type]!,
      'memberNote': instance.memberNote,
      'admitterNote': instance.admitterNote,
      'confirmedAt': instance.confirmedAt?.toIso8601String(),
      'rejectedAt': instance.rejectedAt,
      'admitterId': instance.admitterId,
    };

const _$AbsenceTypeEnumMap = {
  AbsenceType.sickness: 'sickness',
  AbsenceType.vacation: 'vacation',
};

_$AbsencesImpl _$$AbsencesImplFromJson(Map<String, dynamic> json) =>
    _$AbsencesImpl(
      list: (json['list'] as List<dynamic>)
          .map((e) => Absence.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int,
    );

Map<String, dynamic> _$$AbsencesImplToJson(_$AbsencesImpl instance) =>
    <String, dynamic>{
      'list': instance.list,
      'total': instance.total,
    };
