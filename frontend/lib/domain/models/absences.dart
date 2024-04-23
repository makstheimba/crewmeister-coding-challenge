import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'absences.freezed.dart';
part 'absences.g.dart';

enum AbsenceType { sickness, vacation }

enum AbsenceStatus { requested, confirmed, rejected }

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
    @JsonKey(fromJson: _dateFromJson) DateTime? confirmedAt,
    @JsonKey(fromJson: _dateFromJson) DateTime? rejectedAt,
    String? admitterNote,
    String? memberNote,
    int? admitterId,
  }) = _Absence;

  factory Absence.fromJson(Map<String, dynamic> json) => _$AbsenceFromJson(json);

  const Absence._();

  AbsenceStatus get status => confirmedAt != null
      ? AbsenceStatus.confirmed
      : rejectedAt != null
          ? AbsenceStatus.rejected
          : AbsenceStatus.requested;

  String formatToICal(String? userName) {
    final formatter = DateFormat("yyyyMMdd'T'HHmmss'Z'");

    final components = [
      'BEGIN:VEVENT',
      'UID:$id+$userId+$crewId',
      'DTSTAMP:${formatter.format(createdAt.toUtc())}',
      'DTSTART:${formatter.format(startDate.toUtc())}',
      'DTEND:${formatter.format(endDate.toUtc())}',
      'SUMMARY:Absence of ${userName ?? userId} from Crew $crewId',
      "DESCRIPTION:Type:${type.toJsonString()} \\nMemberNote:${memberNote ?? ''} \\nAdmitterNote: ${admitterNote ?? ''}",
      'END:VEVENT',
    ];

    return components.join('\r\n');
  }
}

@freezed
class Absences with _$Absences {
  const factory Absences({
    required List<Absence> list,
    required int total,
  }) = _Absences;

  factory Absences.fromJson(Map<String, dynamic> json) => _$AbsencesFromJson(json);
}
