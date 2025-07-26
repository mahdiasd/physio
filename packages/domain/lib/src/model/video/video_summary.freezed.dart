// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VideoSummary {
  String get id;
  String get title;
  String get description;
  String get coverPhoto;
  String get category;
  int get viewCount;
  UploaderUser get uploader;

  /// Create a copy of VideoSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VideoSummaryCopyWith<VideoSummary> get copyWith =>
      _$VideoSummaryCopyWithImpl<VideoSummary>(
          this as VideoSummary, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VideoSummary &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.coverPhoto, coverPhoto) ||
                other.coverPhoto == coverPhoto) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.uploader, uploader) ||
                other.uploader == uploader));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, description,
      coverPhoto, category, viewCount, uploader);

  @override
  String toString() {
    return 'VideoSummary(id: $id, title: $title, description: $description, coverPhoto: $coverPhoto, category: $category, viewCount: $viewCount, uploader: $uploader)';
  }
}

/// @nodoc
abstract mixin class $VideoSummaryCopyWith<$Res> {
  factory $VideoSummaryCopyWith(
          VideoSummary value, $Res Function(VideoSummary) _then) =
      _$VideoSummaryCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String coverPhoto,
      String category,
      int viewCount,
      UploaderUser uploader});

  $UploaderUserCopyWith<$Res> get uploader;
}

/// @nodoc
class _$VideoSummaryCopyWithImpl<$Res> implements $VideoSummaryCopyWith<$Res> {
  _$VideoSummaryCopyWithImpl(this._self, this._then);

  final VideoSummary _self;
  final $Res Function(VideoSummary) _then;

  /// Create a copy of VideoSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? coverPhoto = null,
    Object? category = null,
    Object? viewCount = null,
    Object? uploader = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      coverPhoto: null == coverPhoto
          ? _self.coverPhoto
          : coverPhoto // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      viewCount: null == viewCount
          ? _self.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      uploader: null == uploader
          ? _self.uploader
          : uploader // ignore: cast_nullable_to_non_nullable
              as UploaderUser,
    ));
  }

  /// Create a copy of VideoSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UploaderUserCopyWith<$Res> get uploader {
    return $UploaderUserCopyWith<$Res>(_self.uploader, (value) {
      return _then(_self.copyWith(uploader: value));
    });
  }
}

/// @nodoc

class _VideoSummary implements VideoSummary {
  const _VideoSummary(
      {required this.id,
      required this.title,
      required this.description,
      required this.coverPhoto,
      required this.category,
      required this.viewCount,
      required this.uploader});

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String coverPhoto;
  @override
  final String category;
  @override
  final int viewCount;
  @override
  final UploaderUser uploader;

  /// Create a copy of VideoSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VideoSummaryCopyWith<_VideoSummary> get copyWith =>
      __$VideoSummaryCopyWithImpl<_VideoSummary>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VideoSummary &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.coverPhoto, coverPhoto) ||
                other.coverPhoto == coverPhoto) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.uploader, uploader) ||
                other.uploader == uploader));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, description,
      coverPhoto, category, viewCount, uploader);

  @override
  String toString() {
    return 'VideoSummary(id: $id, title: $title, description: $description, coverPhoto: $coverPhoto, category: $category, viewCount: $viewCount, uploader: $uploader)';
  }
}

/// @nodoc
abstract mixin class _$VideoSummaryCopyWith<$Res>
    implements $VideoSummaryCopyWith<$Res> {
  factory _$VideoSummaryCopyWith(
          _VideoSummary value, $Res Function(_VideoSummary) _then) =
      __$VideoSummaryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String coverPhoto,
      String category,
      int viewCount,
      UploaderUser uploader});

  @override
  $UploaderUserCopyWith<$Res> get uploader;
}

/// @nodoc
class __$VideoSummaryCopyWithImpl<$Res>
    implements _$VideoSummaryCopyWith<$Res> {
  __$VideoSummaryCopyWithImpl(this._self, this._then);

  final _VideoSummary _self;
  final $Res Function(_VideoSummary) _then;

  /// Create a copy of VideoSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? coverPhoto = null,
    Object? category = null,
    Object? viewCount = null,
    Object? uploader = null,
  }) {
    return _then(_VideoSummary(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      coverPhoto: null == coverPhoto
          ? _self.coverPhoto
          : coverPhoto // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      viewCount: null == viewCount
          ? _self.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
      uploader: null == uploader
          ? _self.uploader
          : uploader // ignore: cast_nullable_to_non_nullable
              as UploaderUser,
    ));
  }

  /// Create a copy of VideoSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UploaderUserCopyWith<$Res> get uploader {
    return $UploaderUserCopyWith<$Res>(_self.uploader, (value) {
      return _then(_self.copyWith(uploader: value));
    });
  }
}

// dart format on
