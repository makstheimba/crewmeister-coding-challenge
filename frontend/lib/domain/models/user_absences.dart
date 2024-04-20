import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_absences.freezed.dart';
part 'user_absences.g.dart';

enum UserAbscenceType { sickness, vacation }

extension UserAbscenceTypeExtension on UserAbscenceType {
  static UserAbscenceType fromString(String type) {
    switch (type) {
      case 'sickness':
        return UserAbscenceType.sickness;
      case 'vacation':
        return UserAbscenceType.vacation;
      default:
        throw Exception('Unknown UserAbscenceType: $type');
    }
  }
}

DateTime? _dateFromJson(String? date) => date != null ? DateTime.parse(date) : null;

@freezed
class UserAbsence with _$UserAbsence {
  const factory UserAbsence({
    required int crewId,
    required int id,
    required int userId,
    @JsonKey(fromJson: DateTime.parse) required DateTime createdAt,
    @JsonKey(fromJson: DateTime.parse) required DateTime endDate,
    @JsonKey(fromJson: DateTime.parse) required DateTime startDate,
    @JsonKey(fromJson: UserAbscenceTypeExtension.fromString) required UserAbscenceType type,
    @Default('') String memberNote,
    @Default('') String admitterNote,
    @JsonKey(fromJson: _dateFromJson) DateTime? confirmedAt,
    String? rejectedAt,
    int? admitterId,
  }) = _UserAbscence;

  factory UserAbsence.fromJson(Map<String, dynamic> json) => _$UserAbsenceFromJson(json);
}
