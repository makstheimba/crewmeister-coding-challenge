import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/domain/models/absences.dart';

part 'absences_state.freezed.dart';

@freezed
class AbsencesState with _$AbsencesState {
  const factory AbsencesState({
    @Default([]) List<Absence> absences,
    @Default(0) int total,
    @Default(false) bool isLoading,
    String? errorMessage,
    AbsenceType? filterType,
    DateTime? filterDate,
  }) = _AbsencesState;
}
