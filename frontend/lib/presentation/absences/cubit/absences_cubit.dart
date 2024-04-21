import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/data/api/absences_api.dart';
import 'package:frontend/domain/models/absences.dart';
import 'package:frontend/presentation/absences/cubit/absences_state.dart';
import 'package:intl/intl.dart';

class AbsencesCubit extends Cubit<AbsencesState> {
  AbsencesCubit(this._api) : super(const AbsencesState.initial());

  final AbsencesApi _api;

  Future<void> loadAbsences({int page = 1, AbsenceType? type, DateTime? date}) async {
    emit(const AbsencesState.loading());
    try {
      final response = await _api.getAbsences(
        page: page,
        type: type?.toJsonString(),
        date: date != null ? DateFormat('yyyy-MM-dd').format(date) : null,
      );

      emit(
        AbsencesState.loaded(
          absences: response.payload,
          total: response.payload.length, // TODO: use proper total value
          currentPage: page,
        ),
      );
    } catch (e) {
      emit(AbsencesState.error(e.toString()));
    }
  }
}
