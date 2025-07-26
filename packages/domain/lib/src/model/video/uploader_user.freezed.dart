// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'uploader_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UploaderUser {
  String get firstName;
  String get lastName;

  /// Create a copy of UploaderUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UploaderUserCopyWith<UploaderUser> get copyWith =>
      _$UploaderUserCopyWithImpl<UploaderUser>(
          this as UploaderUser, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UploaderUser &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName);

  @override
  String toString() {
    return 'UploaderUser(firstName: $firstName, lastName: $lastName)';
  }
}

/// @nodoc
abstract mixin class $UploaderUserCopyWith<$Res> {
  factory $UploaderUserCopyWith(
          UploaderUser value, $Res Function(UploaderUser) _then) =
      _$UploaderUserCopyWithImpl;
  @useResult
  $Res call({String firstName, String lastName});
}

/// @nodoc
class _$UploaderUserCopyWithImpl<$Res> implements $UploaderUserCopyWith<$Res> {
  _$UploaderUserCopyWithImpl(this._self, this._then);

  final UploaderUser _self;
  final $Res Function(UploaderUser) _then;

  /// Create a copy of UploaderUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
  }) {
    return _then(_self.copyWith(
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _UploaderUser implements UploaderUser {
  const _UploaderUser({required this.firstName, required this.lastName});

  @override
  final String firstName;
  @override
  final String lastName;

  /// Create a copy of UploaderUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UploaderUserCopyWith<_UploaderUser> get copyWith =>
      __$UploaderUserCopyWithImpl<_UploaderUser>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UploaderUser &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName);

  @override
  String toString() {
    return 'UploaderUser(firstName: $firstName, lastName: $lastName)';
  }
}

/// @nodoc
abstract mixin class _$UploaderUserCopyWith<$Res>
    implements $UploaderUserCopyWith<$Res> {
  factory _$UploaderUserCopyWith(
          _UploaderUser value, $Res Function(_UploaderUser) _then) =
      __$UploaderUserCopyWithImpl;
  @override
  @useResult
  $Res call({String firstName, String lastName});
}

/// @nodoc
class __$UploaderUserCopyWithImpl<$Res>
    implements _$UploaderUserCopyWith<$Res> {
  __$UploaderUserCopyWithImpl(this._self, this._then);

  final _UploaderUser _self;
  final $Res Function(_UploaderUser) _then;

  /// Create a copy of UploaderUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
  }) {
    return _then(_UploaderUser(
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
