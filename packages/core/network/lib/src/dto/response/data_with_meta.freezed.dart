// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_with_meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DataWithMeta<T> {
  T get data;
  PagingMetaResponse? get meta;

  /// Create a copy of DataWithMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DataWithMetaCopyWith<T, DataWithMeta<T>> get copyWith =>
      _$DataWithMetaCopyWithImpl<T, DataWithMeta<T>>(
          this as DataWithMeta<T>, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DataWithMeta<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data), meta);

  @override
  String toString() {
    return 'DataWithMeta<$T>(data: $data, meta: $meta)';
  }
}

/// @nodoc
abstract mixin class $DataWithMetaCopyWith<T, $Res> {
  factory $DataWithMetaCopyWith(
          DataWithMeta<T> value, $Res Function(DataWithMeta<T>) _then) =
      _$DataWithMetaCopyWithImpl;
  @useResult
  $Res call({T data, PagingMetaResponse? meta});
}

/// @nodoc
class _$DataWithMetaCopyWithImpl<T, $Res>
    implements $DataWithMetaCopyWith<T, $Res> {
  _$DataWithMetaCopyWithImpl(this._self, this._then);

  final DataWithMeta<T> _self;
  final $Res Function(DataWithMeta<T>) _then;

  /// Create a copy of DataWithMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? meta = freezed,
  }) {
    return _then(_self.copyWith(
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      meta: freezed == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PagingMetaResponse?,
    ));
  }
}

/// @nodoc

class _DataWithMeta<T> implements DataWithMeta<T> {
  const _DataWithMeta({required this.data, this.meta});

  @override
  final T data;
  @override
  final PagingMetaResponse? meta;

  /// Create a copy of DataWithMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DataWithMetaCopyWith<T, _DataWithMeta<T>> get copyWith =>
      __$DataWithMetaCopyWithImpl<T, _DataWithMeta<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DataWithMeta<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data), meta);

  @override
  String toString() {
    return 'DataWithMeta<$T>(data: $data, meta: $meta)';
  }
}

/// @nodoc
abstract mixin class _$DataWithMetaCopyWith<T, $Res>
    implements $DataWithMetaCopyWith<T, $Res> {
  factory _$DataWithMetaCopyWith(
          _DataWithMeta<T> value, $Res Function(_DataWithMeta<T>) _then) =
      __$DataWithMetaCopyWithImpl;
  @override
  @useResult
  $Res call({T data, PagingMetaResponse? meta});
}

/// @nodoc
class __$DataWithMetaCopyWithImpl<T, $Res>
    implements _$DataWithMetaCopyWith<T, $Res> {
  __$DataWithMetaCopyWithImpl(this._self, this._then);

  final _DataWithMeta<T> _self;
  final $Res Function(_DataWithMeta<T>) _then;

  /// Create a copy of DataWithMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
    Object? meta = freezed,
  }) {
    return _then(_DataWithMeta<T>(
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      meta: freezed == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as PagingMetaResponse?,
    ));
  }
}

// dart format on
