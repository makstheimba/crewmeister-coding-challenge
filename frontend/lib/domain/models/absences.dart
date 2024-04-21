import 'package:freezed_annotation/freezed_annotation.dart';

part 'absences.freezed.dart';
part 'absences.g.dart';

enum AbsenceType { sickness, vacation }

extension AbsenceTypeExtension on AbsenceType {
  static AbsenceType fromString(String type) {
    switch (type) {
      case 'sickness':
        return AbsenceType.sickness;
      case 'vacation':
        return AbsenceType.vacation;
      default:
        throw Exception('Unknown UserAbscenceType: $type');
    }
  }

  String toJsonString() {
    return toString().split('.').last;
  }
}

DateTime? _dateFromJson(String? date) => date != null ? DateTime.parse(date) : null;

@freezed
class Absence with _$Absence {
  const factory Absence({
    required int crewId,
    required int id,
    required int userId,
    @JsonKey(fromJson: DateTime.parse) required DateTime createdAt,
    @JsonKey(fromJson: DateTime.parse) required DateTime endDate,
    @JsonKey(fromJson: DateTime.parse) required DateTime startDate,
    @JsonKey(fromJson: AbsenceTypeExtension.fromString) required AbsenceType type,
    @Default('') String memberNote,
    @Default('') String admitterNote,
    @JsonKey(fromJson: _dateFromJson) DateTime? confirmedAt,
    String? rejectedAt,
    int? admitterId,
  }) = _Absence;

  factory Absence.fromJson(Map<String, dynamic> json) => _$AbsenceFromJson(json);
}
