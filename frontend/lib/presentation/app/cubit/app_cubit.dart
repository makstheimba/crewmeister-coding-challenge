import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/data/api/user_api.dart';
import 'package:frontend/domain/models/user.dart';
import 'package:frontend/presentation/app/cubit/app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(this._userApi) : super(const AppState.initial());

  final UserApi _userApi;

  Future<void> initialize() async {
    emit(const AppState.loading());
    try {
      final response = await _userApi.getUsers();
      final usersMap = HashMap<int, User>();

      for (final user in response.payload) {
        usersMap[user.userId] = user;
      }

      emit(AppState.loaded(users: usersMap));
    } catch (e) {
      if (kDebugMode) {
        print('[AppCubit]: error fetching users $e');
      }
      emit(AppState.error(e.toString()));
    }
  }
}
