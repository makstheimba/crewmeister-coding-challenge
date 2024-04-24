import 'dart:collection';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/domain/models/user.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState.initial() = _Initial;
  const factory AppState.loading() = _Loading;
  const factory AppState.loaded({required HashMap<int, User> users}) = _Loaded;
  const factory AppState.error(String message) = _Error;
}
