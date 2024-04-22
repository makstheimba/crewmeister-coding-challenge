// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'absences_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AbsencesState {
  List<Absence> get absences => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  AbsenceType? get filterType => throw _privateConstructorUsedError;
  DateTime? get filterDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AbsencesStateCopyWith<AbsencesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbsencesStateCopyWith<$Res> {
  factory $AbsencesStateCopyWith(
          AbsencesState value, $Res Function(AbsencesState) then) =
      _$AbsencesStateCopyWithImpl<$Res, AbsencesState>;
  @useResult
  $Res call(
      {List<Absence> absences,
      int total,
      bool isLoading,
      String? errorMessage,
      AbsenceType? filterType,
      DateTime? filterDate});
}

/// @nodoc
class _$AbsencesStateCopyWithImpl<$Res, $Val extends AbsencesState>
    implements $AbsencesStateCopyWith<$Res> {
  _$AbsencesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? absences = null,
    Object? total = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? filterType = freezed,
    Object? filterDate = freezed,
  }) {
    return _then(_value.copyWith(
      absences: null == absences
          ? _value.absences
          : absences // ignore: cast_nullable_to_non_nullable
              as List<Absence>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      filterType: freezed == filterType
          ? _value.filterType
          : filterType // ignore: cast_nullable_to_non_nullable
              as AbsenceType?,
      filterDate: freezed == filterDate
          ? _value.filterDate
          : filterDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AbsencesStateImplCopyWith<$Res>
    implements $AbsencesStateCopyWith<$Res> {
  factory _$$AbsencesStateImplCopyWith(
          _$AbsencesStateImpl value, $Res Function(_$AbsencesStateImpl) then) =
      __$$AbsencesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Absence> absences,
      int total,
      bool isLoading,
      String? errorMessage,
      AbsenceType? filterType,
      DateTime? filterDate});
}

/// @nodoc
class __$$AbsencesStateImplCopyWithImpl<$Res>
    extends _$AbsencesStateCopyWithImpl<$Res, _$AbsencesStateImpl>
    implements _$$AbsencesStateImplCopyWith<$Res> {
  __$$AbsencesStateImplCopyWithImpl(
      _$AbsencesStateImpl _value, $Res Function(_$AbsencesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? absences = null,
    Object? total = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? filterType = freezed,
    Object? filterDate = freezed,
  }) {
    return _then(_$AbsencesStateImpl(
      absences: null == absences
          ? _value._absences
          : absences // ignore: cast_nullable_to_non_nullable
              as List<Absence>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      filterType: freezed == filterType
          ? _value.filterType
          : filterType // ignore: cast_nullable_to_non_nullable
              as AbsenceType?,
      filterDate: freezed == filterDate
          ? _value.filterDate
          : filterDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$AbsencesStateImpl implements _AbsencesState {
  const _$AbsencesStateImpl(
      {final List<Absence> absences = const [],
      this.total = 0,
      this.isLoading = false,
      this.errorMessage,
      this.filterType,
      this.filterDate})
      : _absences = absences;

  final List<Absence> _absences;
  @override
  @JsonKey()
  List<Absence> get absences {
    if (_absences is EqualUnmodifiableListView) return _absences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_absences);
  }

  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;
  @override
  final AbsenceType? filterType;
  @override
  final DateTime? filterDate;

  @override
  String toString() {
    return 'AbsencesState(absences: $absences, total: $total, isLoading: $isLoading, errorMessage: $errorMessage, filterType: $filterType, filterDate: $filterDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AbsencesStateImpl &&
            const DeepCollectionEquality().equals(other._absences, _absences) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.filterType, filterType) ||
                other.filterType == filterType) &&
            (identical(other.filterDate, filterDate) ||
                other.filterDate == filterDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_absences),
      total,
      isLoading,
      errorMessage,
      filterType,
      filterDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AbsencesStateImplCopyWith<_$AbsencesStateImpl> get copyWith =>
      __$$AbsencesStateImplCopyWithImpl<_$AbsencesStateImpl>(this, _$identity);
}

abstract class _AbsencesState implements AbsencesState {
  const factory _AbsencesState(
      {final List<Absence> absences,
      final int total,
      final bool isLoading,
      final String? errorMessage,
      final AbsenceType? filterType,
      final DateTime? filterDate}) = _$AbsencesStateImpl;

  @override
  List<Absence> get absences;
  @override
  int get total;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  AbsenceType? get filterType;
  @override
  DateTime? get filterDate;
  @override
  @JsonKey(ignore: true)
  _$$AbsencesStateImplCopyWith<_$AbsencesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
