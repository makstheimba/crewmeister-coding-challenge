import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/data/api/absences_api.dart';
import 'package:frontend/domain/models/absences.dart';
import 'package:frontend/presentation/absences/cubit/absences_state.dart';
import 'package:intl/intl.dart';

class AbsencesCubit extends Cubit<AbsencesState> {
  AbsencesCubit(this._api) : super(const AbsencesState());
  final AbsencesApi _api;

  Future<void> loadAbsences({AbsenceType? type, DateTime? date}) async {
    if (state.filterType != type || state.filterDate != date) {
      emit(
        state.copyWith(
          isLoading: true,
          errorMessage: null,
          absences: [],
          filterType: type,
          filterDate: date,
          total: 0,
        ),
      );
    } else {
      emit(state.copyWith(isLoading: true, errorMessage: null));
    }

    try {
      final response = await _api.getAbsences(
        page: state.absences.length ~/ 10 + 1,
        type: type?.toJsonString(),
        date: date != null ? DateFormat('yyyy-MM-dd').format(date) : null,
      );
      final updatedAbsences = List<Absence>.from(state.absences)..addAll(response.payload.list);
      emit(
        state.copyWith(
          absences: updatedAbsences,
          total: response.payload.total,
          isLoading: false,
        ),
      );
    } catch (e) {
      print('[AbsencesCubit]: error fetching absences ${e.toString()}');
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
