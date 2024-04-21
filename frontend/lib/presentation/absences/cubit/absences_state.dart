import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/domain/models/absences.dart';

part 'absences_state.freezed.dart';

// TODO: store selected filters in the state
@freezed
class AbsencesState with _$AbsencesState {
  const factory AbsencesState.initial() = _Initial;
  const factory AbsencesState.loading() = _Loading;
  const factory AbsencesState.loaded({
    required List<Absence> absences,
    required int total,
    required int currentPage,
  }) = _Loaded;
  const factory AbsencesState.error(String message) = _Error;
}
