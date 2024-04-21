// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'absences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Absence _$AbsenceFromJson(Map<String, dynamic> json) {
  return _Absence.fromJson(json);
}

/// @nodoc
mixin _$Absence {
  int get crewId => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: DateTime.parse)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: DateTime.parse)
  DateTime get endDate => throw _privateConstructorUsedError;
  @JsonKey(fromJson: DateTime.parse)
  DateTime get startDate => throw _privateConstructorUsedError;
  @JsonKey(fromJson: AbsenceTypeExtension.fromString)
  AbsenceType get type => throw _privateConstructorUsedError;
  String get memberNote => throw _privateConstructorUsedError;
  String get admitterNote => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _dateFromJson)
  DateTime? get confirmedAt => throw _privateConstructorUsedError;
  String? get rejectedAt => throw _privateConstructorUsedError;
  int? get admitterId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AbsenceCopyWith<Absence> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbsenceCopyWith<$Res> {
  factory $AbsenceCopyWith(Absence value, $Res Function(Absence) then) =
      _$AbsenceCopyWithImpl<$Res, Absence>;
  @useResult
  $Res call(
      {int crewId,
      int id,
      int userId,
      @JsonKey(fromJson: DateTime.parse) DateTime createdAt,
      @JsonKey(fromJson: DateTime.parse) DateTime endDate,
      @JsonKey(fromJson: DateTime.parse) DateTime startDate,
      @JsonKey(fromJson: AbsenceTypeExtension.fromString) AbsenceType type,
      String memberNote,
      String admitterNote,
      @JsonKey(fromJson: _dateFromJson) DateTime? confirmedAt,
      String? rejectedAt,
      int? admitterId});
}

/// @nodoc
class _$AbsenceCopyWithImpl<$Res, $Val extends Absence>
    implements $AbsenceCopyWith<$Res> {
  _$AbsenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? crewId = null,
    Object? id = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? endDate = null,
    Object? startDate = null,
    Object? type = null,
    Object? memberNote = null,
    Object? admitterNote = null,
    Object? confirmedAt = freezed,
    Object? rejectedAt = freezed,
    Object? admitterId = freezed,
  }) {
    return _then(_value.copyWith(
      crewId: null == crewId
          ? _value.crewId
          : crewId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AbsenceType,
      memberNote: null == memberNote
          ? _value.memberNote
          : memberNote // ignore: cast_nullable_to_non_nullable
              as String,
      admitterNote: null == admitterNote
          ? _value.admitterNote
          : admitterNote // ignore: cast_nullable_to_non_nullable
              as String,
      confirmedAt: freezed == confirmedAt
          ? _value.confirmedAt
          : confirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rejectedAt: freezed == rejectedAt
          ? _value.rejectedAt
          : rejectedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      admitterId: freezed == admitterId
          ? _value.admitterId
          : admitterId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AbsenceImplCopyWith<$Res> implements $AbsenceCopyWith<$Res> {
  factory _$$AbsenceImplCopyWith(
          _$AbsenceImpl value, $Res Function(_$AbsenceImpl) then) =
      __$$AbsenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int crewId,
      int id,
      int userId,
      @JsonKey(fromJson: DateTime.parse) DateTime createdAt,
      @JsonKey(fromJson: DateTime.parse) DateTime endDate,
      @JsonKey(fromJson: DateTime.parse) DateTime startDate,
      @JsonKey(fromJson: AbsenceTypeExtension.fromString) AbsenceType type,
      String memberNote,
      String admitterNote,
      @JsonKey(fromJson: _dateFromJson) DateTime? confirmedAt,
      String? rejectedAt,
      int? admitterId});
}

/// @nodoc
class __$$AbsenceImplCopyWithImpl<$Res>
    extends _$AbsenceCopyWithImpl<$Res, _$AbsenceImpl>
    implements _$$AbsenceImplCopyWith<$Res> {
  __$$AbsenceImplCopyWithImpl(
      _$AbsenceImpl _value, $Res Function(_$AbsenceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? crewId = null,
    Object? id = null,
    Object? userId = null,
    Object? createdAt = null,
    Object? endDate = null,
    Object? startDate = null,
    Object? type = null,
    Object? memberNote = null,
    Object? admitterNote = null,
    Object? confirmedAt = freezed,
    Object? rejectedAt = freezed,
    Object? admitterId = freezed,
  }) {
    return _then(_$AbsenceImpl(
      crewId: null == crewId
          ? _value.crewId
          : crewId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AbsenceType,
      memberNote: null == memberNote
          ? _value.memberNote
          : memberNote // ignore: cast_nullable_to_non_nullable
              as String,
      admitterNote: null == admitterNote
          ? _value.admitterNote
          : admitterNote // ignore: cast_nullable_to_non_nullable
              as String,
      confirmedAt: freezed == confirmedAt
          ? _value.confirmedAt
          : confirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rejectedAt: freezed == rejectedAt
          ? _value.rejectedAt
          : rejectedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      admitterId: freezed == admitterId
          ? _value.admitterId
          : admitterId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AbsenceImpl implements _Absence {
  const _$AbsenceImpl(
      {required this.crewId,
      required this.id,
      required this.userId,
      @JsonKey(fromJson: DateTime.parse) required this.createdAt,
      @JsonKey(fromJson: DateTime.parse) required this.endDate,
      @JsonKey(fromJson: DateTime.parse) required this.startDate,
      @JsonKey(fromJson: AbsenceTypeExtension.fromString) required this.type,
      this.memberNote = '',
      this.admitterNote = '',
      @JsonKey(fromJson: _dateFromJson) this.confirmedAt,
      this.rejectedAt,
      this.admitterId});

  factory _$AbsenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$AbsenceImplFromJson(json);

  @override
  final int crewId;
  @override
  final int id;
  @override
  final int userId;
  @override
  @JsonKey(fromJson: DateTime.parse)
  final DateTime createdAt;
  @override
  @JsonKey(fromJson: DateTime.parse)
  final DateTime endDate;
  @override
  @JsonKey(fromJson: DateTime.parse)
  final DateTime startDate;
  @override
  @JsonKey(fromJson: AbsenceTypeExtension.fromString)
  final AbsenceType type;
  @override
  @JsonKey()
  final String memberNote;
  @override
  @JsonKey()
  final String admitterNote;
  @override
  @JsonKey(fromJson: _dateFromJson)
  final DateTime? confirmedAt;
  @override
  final String? rejectedAt;
  @override
  final int? admitterId;

  @override
  String toString() {
    return 'Absence(crewId: $crewId, id: $id, userId: $userId, createdAt: $createdAt, endDate: $endDate, startDate: $startDate, type: $type, memberNote: $memberNote, admitterNote: $admitterNote, confirmedAt: $confirmedAt, rejectedAt: $rejectedAt, admitterId: $admitterId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AbsenceImpl &&
            (identical(other.crewId, crewId) || other.crewId == crewId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.memberNote, memberNote) ||
                other.memberNote == memberNote) &&
            (identical(other.admitterNote, admitterNote) ||
                other.admitterNote == admitterNote) &&
            (identical(other.confirmedAt, confirmedAt) ||
                other.confirmedAt == confirmedAt) &&
            (identical(other.rejectedAt, rejectedAt) ||
                other.rejectedAt == rejectedAt) &&
            (identical(other.admitterId, admitterId) ||
                other.admitterId == admitterId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      crewId,
      id,
      userId,
      createdAt,
      endDate,
      startDate,
      type,
      memberNote,
      admitterNote,
      confirmedAt,
      rejectedAt,
      admitterId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AbsenceImplCopyWith<_$AbsenceImpl> get copyWith =>
      __$$AbsenceImplCopyWithImpl<_$AbsenceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AbsenceImplToJson(
      this,
    );
  }
}

abstract class _Absence implements Absence {
  const factory _Absence(
      {required final int crewId,
      required final int id,
      required final int userId,
      @JsonKey(fromJson: DateTime.parse) required final DateTime createdAt,
      @JsonKey(fromJson: DateTime.parse) required final DateTime endDate,
      @JsonKey(fromJson: DateTime.parse) required final DateTime startDate,
      @JsonKey(fromJson: AbsenceTypeExtension.fromString)
      required final AbsenceType type,
      final String memberNote,
      final String admitterNote,
      @JsonKey(fromJson: _dateFromJson) final DateTime? confirmedAt,
      final String? rejectedAt,
      final int? admitterId}) = _$AbsenceImpl;

  factory _Absence.fromJson(Map<String, dynamic> json) = _$AbsenceImpl.fromJson;

  @override
  int get crewId;
  @override
  int get id;
  @override
  int get userId;
  @override
  @JsonKey(fromJson: DateTime.parse)
  DateTime get createdAt;
  @override
  @JsonKey(fromJson: DateTime.parse)
  DateTime get endDate;
  @override
  @JsonKey(fromJson: DateTime.parse)
  DateTime get startDate;
  @override
  @JsonKey(fromJson: AbsenceTypeExtension.fromString)
  AbsenceType get type;
  @override
  String get memberNote;
  @override
  String get admitterNote;
  @override
  @JsonKey(fromJson: _dateFromJson)
  DateTime? get confirmedAt;
  @override
  String? get rejectedAt;
  @override
  int? get admitterId;
  @override
  @JsonKey(ignore: true)
  _$$AbsenceImplCopyWith<_$AbsenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
