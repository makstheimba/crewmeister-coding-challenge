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
  @JsonKey(fromJson: _dateFromJson)
  DateTime? get confirmedAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _dateFromJson)
  DateTime? get rejectedAt => throw _privateConstructorUsedError;
  String? get admitterNote => throw _privateConstructorUsedError;
  String? get memberNote => throw _privateConstructorUsedError;
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
      @JsonKey(fromJson: _dateFromJson) DateTime? confirmedAt,
      @JsonKey(fromJson: _dateFromJson) DateTime? rejectedAt,
      String? admitterNote,
      String? memberNote,
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
    Object? confirmedAt = freezed,
    Object? rejectedAt = freezed,
    Object? admitterNote = freezed,
    Object? memberNote = freezed,
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
      confirmedAt: freezed == confirmedAt
          ? _value.confirmedAt
          : confirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rejectedAt: freezed == rejectedAt
          ? _value.rejectedAt
          : rejectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      admitterNote: freezed == admitterNote
          ? _value.admitterNote
          : admitterNote // ignore: cast_nullable_to_non_nullable
              as String?,
      memberNote: freezed == memberNote
          ? _value.memberNote
          : memberNote // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(fromJson: _dateFromJson) DateTime? confirmedAt,
      @JsonKey(fromJson: _dateFromJson) DateTime? rejectedAt,
      String? admitterNote,
      String? memberNote,
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
    Object? confirmedAt = freezed,
    Object? rejectedAt = freezed,
    Object? admitterNote = freezed,
    Object? memberNote = freezed,
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
      confirmedAt: freezed == confirmedAt
          ? _value.confirmedAt
          : confirmedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rejectedAt: freezed == rejectedAt
          ? _value.rejectedAt
          : rejectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      admitterNote: freezed == admitterNote
          ? _value.admitterNote
          : admitterNote // ignore: cast_nullable_to_non_nullable
              as String?,
      memberNote: freezed == memberNote
          ? _value.memberNote
          : memberNote // ignore: cast_nullable_to_non_nullable
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
class _$AbsenceImpl extends _Absence {
  const _$AbsenceImpl(
      {required this.crewId,
      required this.id,
      required this.userId,
      @JsonKey(fromJson: DateTime.parse) required this.createdAt,
      @JsonKey(fromJson: DateTime.parse) required this.endDate,
      @JsonKey(fromJson: DateTime.parse) required this.startDate,
      @JsonKey(fromJson: AbsenceTypeExtension.fromString) required this.type,
      @JsonKey(fromJson: _dateFromJson) this.confirmedAt,
      @JsonKey(fromJson: _dateFromJson) this.rejectedAt,
      this.admitterNote,
      this.memberNote,
      this.admitterId})
      : super._();

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
  @JsonKey(fromJson: _dateFromJson)
  final DateTime? confirmedAt;
  @override
  @JsonKey(fromJson: _dateFromJson)
  final DateTime? rejectedAt;
  @override
  final String? admitterNote;
  @override
  final String? memberNote;
  @override
  final int? admitterId;

  @override
  String toString() {
    return 'Absence(crewId: $crewId, id: $id, userId: $userId, createdAt: $createdAt, endDate: $endDate, startDate: $startDate, type: $type, confirmedAt: $confirmedAt, rejectedAt: $rejectedAt, admitterNote: $admitterNote, memberNote: $memberNote, admitterId: $admitterId)';
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
            (identical(other.confirmedAt, confirmedAt) ||
                other.confirmedAt == confirmedAt) &&
            (identical(other.rejectedAt, rejectedAt) ||
                other.rejectedAt == rejectedAt) &&
            (identical(other.admitterNote, admitterNote) ||
                other.admitterNote == admitterNote) &&
            (identical(other.memberNote, memberNote) ||
                other.memberNote == memberNote) &&
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
      confirmedAt,
      rejectedAt,
      admitterNote,
      memberNote,
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

abstract class _Absence extends Absence {
  const factory _Absence(
      {required final int crewId,
      required final int id,
      required final int userId,
      @JsonKey(fromJson: DateTime.parse) required final DateTime createdAt,
      @JsonKey(fromJson: DateTime.parse) required final DateTime endDate,
      @JsonKey(fromJson: DateTime.parse) required final DateTime startDate,
      @JsonKey(fromJson: AbsenceTypeExtension.fromString)
      required final AbsenceType type,
      @JsonKey(fromJson: _dateFromJson) final DateTime? confirmedAt,
      @JsonKey(fromJson: _dateFromJson) final DateTime? rejectedAt,
      final String? admitterNote,
      final String? memberNote,
      final int? admitterId}) = _$AbsenceImpl;
  const _Absence._() : super._();

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
  @JsonKey(fromJson: _dateFromJson)
  DateTime? get confirmedAt;
  @override
  @JsonKey(fromJson: _dateFromJson)
  DateTime? get rejectedAt;
  @override
  String? get admitterNote;
  @override
  String? get memberNote;
  @override
  int? get admitterId;
  @override
  @JsonKey(ignore: true)
  _$$AbsenceImplCopyWith<_$AbsenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Absences _$AbsencesFromJson(Map<String, dynamic> json) {
  return _Absences.fromJson(json);
}

/// @nodoc
mixin _$Absences {
  List<Absence> get list => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AbsencesCopyWith<Absences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AbsencesCopyWith<$Res> {
  factory $AbsencesCopyWith(Absences value, $Res Function(Absences) then) =
      _$AbsencesCopyWithImpl<$Res, Absences>;
  @useResult
  $Res call({List<Absence> list, int total});
}

/// @nodoc
class _$AbsencesCopyWithImpl<$Res, $Val extends Absences>
    implements $AbsencesCopyWith<$Res> {
  _$AbsencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<Absence>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AbsencesImplCopyWith<$Res>
    implements $AbsencesCopyWith<$Res> {
  factory _$$AbsencesImplCopyWith(
          _$AbsencesImpl value, $Res Function(_$AbsencesImpl) then) =
      __$$AbsencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Absence> list, int total});
}

/// @nodoc
class __$$AbsencesImplCopyWithImpl<$Res>
    extends _$AbsencesCopyWithImpl<$Res, _$AbsencesImpl>
    implements _$$AbsencesImplCopyWith<$Res> {
  __$$AbsencesImplCopyWithImpl(
      _$AbsencesImpl _value, $Res Function(_$AbsencesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
    Object? total = null,
  }) {
    return _then(_$AbsencesImpl(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<Absence>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AbsencesImpl implements _Absences {
  const _$AbsencesImpl({required final List<Absence> list, required this.total})
      : _list = list;

  factory _$AbsencesImpl.fromJson(Map<String, dynamic> json) =>
      _$$AbsencesImplFromJson(json);

  final List<Absence> _list;
  @override
  List<Absence> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  final int total;

  @override
  String toString() {
    return 'Absences(list: $list, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AbsencesImpl &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_list), total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AbsencesImplCopyWith<_$AbsencesImpl> get copyWith =>
      __$$AbsencesImplCopyWithImpl<_$AbsencesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AbsencesImplToJson(
      this,
    );
  }
}

abstract class _Absences implements Absences {
  const factory _Absences(
      {required final List<Absence> list,
      required final int total}) = _$AbsencesImpl;

  factory _Absences.fromJson(Map<String, dynamic> json) =
      _$AbsencesImpl.fromJson;

  @override
  List<Absence> get list;
  @override
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$AbsencesImplCopyWith<_$AbsencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
