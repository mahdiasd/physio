// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Video {
  String get category;
  String get coverPhoto;
  DateTime get createdAt;
  String get description;
  String get id;
  bool get isPublic;
  List<VideoSummary> get relatedVideos;
  String get status;
  List<String> get tags;
  String get title;
  DateTime get updatedAt;
  UploaderUser get uploader;
  PhysioFile get videoFile;
  bool get isFlagged;

  /// Create a copy of Video
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VideoCopyWith<Video> get copyWith =>
      _$VideoCopyWithImpl<Video>(this as Video, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Video &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.coverPhoto, coverPhoto) ||
                other.coverPhoto == coverPhoto) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic) &&
            const DeepCollectionEquality()
                .equals(other.relatedVideos, relatedVideos) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.uploader, uploader) ||
                other.uploader == uploader) &&
            (identical(other.videoFile, videoFile) ||
                other.videoFile == videoFile) &&
            (identical(other.isFlagged, isFlagged) ||
                other.isFlagged == isFlagged));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      category,
      coverPhoto,
      createdAt,
      description,
      id,
      isPublic,
      const DeepCollectionEquality().hash(relatedVideos),
      status,
      const DeepCollectionEquality().hash(tags),
      title,
      updatedAt,
      uploader,
      videoFile,
      isFlagged);

  @override
  String toString() {
    return 'Video(category: $category, coverPhoto: $coverPhoto, createdAt: $createdAt, description: $description, id: $id, isPublic: $isPublic, relatedVideos: $relatedVideos, status: $status, tags: $tags, title: $title, updatedAt: $updatedAt, uploader: $uploader, videoFile: $videoFile, isFlagged: $isFlagged)';
  }
}

/// @nodoc
abstract mixin class $VideoCopyWith<$Res> {
  factory $VideoCopyWith(Video value, $Res Function(Video) _then) =
      _$VideoCopyWithImpl;
  @useResult
  $Res call(
      {String category,
      String coverPhoto,
      DateTime createdAt,
      String description,
      String id,
      bool isPublic,
      List<VideoSummary> relatedVideos,
      String status,
      List<String> tags,
      String title,
      DateTime updatedAt,
      UploaderUser uploader,
      PhysioFile videoFile,
      bool isFlagged});

  $UploaderUserCopyWith<$Res> get uploader;
}

/// @nodoc
class _$VideoCopyWithImpl<$Res> implements $VideoCopyWith<$Res> {
  _$VideoCopyWithImpl(this._self, this._then);

  final Video _self;
  final $Res Function(Video) _then;

  /// Create a copy of Video
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? coverPhoto = null,
    Object? createdAt = null,
    Object? description = null,
    Object? id = null,
    Object? isPublic = null,
    Object? relatedVideos = null,
    Object? status = null,
    Object? tags = null,
    Object? title = null,
    Object? updatedAt = null,
    Object? uploader = null,
    Object? videoFile = null,
    Object? isFlagged = null,
  }) {
    return _then(_self.copyWith(
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      coverPhoto: null == coverPhoto
          ? _self.coverPhoto
          : coverPhoto // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isPublic: null == isPublic
          ? _self.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      relatedVideos: null == relatedVideos
          ? _self.relatedVideos
          : relatedVideos // ignore: cast_nullable_to_non_nullable
              as List<VideoSummary>,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      uploader: null == uploader
          ? _self.uploader
          : uploader // ignore: cast_nullable_to_non_nullable
              as UploaderUser,
      videoFile: null == videoFile
          ? _self.videoFile
          : videoFile // ignore: cast_nullable_to_non_nullable
              as PhysioFile,
      isFlagged: null == isFlagged
          ? _self.isFlagged
          : isFlagged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of Video
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

class _Video implements Video {
  const _Video(
      {required this.category,
      required this.coverPhoto,
      required this.createdAt,
      required this.description,
      required this.id,
      required this.isPublic,
      required final List<VideoSummary> relatedVideos,
      required this.status,
      required final List<String> tags,
      required this.title,
      required this.updatedAt,
      required this.uploader,
      required this.videoFile,
      required this.isFlagged})
      : _relatedVideos = relatedVideos,
        _tags = tags;

  @override
  final String category;
  @override
  final String coverPhoto;
  @override
  final DateTime createdAt;
  @override
  final String description;
  @override
  final String id;
  @override
  final bool isPublic;
  final List<VideoSummary> _relatedVideos;
  @override
  List<VideoSummary> get relatedVideos {
    if (_relatedVideos is EqualUnmodifiableListView) return _relatedVideos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relatedVideos);
  }

  @override
  final String status;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String title;
  @override
  final DateTime updatedAt;
  @override
  final UploaderUser uploader;
  @override
  final PhysioFile videoFile;
  @override
  final bool isFlagged;

  /// Create a copy of Video
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VideoCopyWith<_Video> get copyWith =>
      __$VideoCopyWithImpl<_Video>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Video &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.coverPhoto, coverPhoto) ||
                other.coverPhoto == coverPhoto) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic) &&
            const DeepCollectionEquality()
                .equals(other._relatedVideos, _relatedVideos) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.uploader, uploader) ||
                other.uploader == uploader) &&
            (identical(other.videoFile, videoFile) ||
                other.videoFile == videoFile) &&
            (identical(other.isFlagged, isFlagged) ||
                other.isFlagged == isFlagged));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      category,
      coverPhoto,
      createdAt,
      description,
      id,
      isPublic,
      const DeepCollectionEquality().hash(_relatedVideos),
      status,
      const DeepCollectionEquality().hash(_tags),
      title,
      updatedAt,
      uploader,
      videoFile,
      isFlagged);

  @override
  String toString() {
    return 'Video(category: $category, coverPhoto: $coverPhoto, createdAt: $createdAt, description: $description, id: $id, isPublic: $isPublic, relatedVideos: $relatedVideos, status: $status, tags: $tags, title: $title, updatedAt: $updatedAt, uploader: $uploader, videoFile: $videoFile, isFlagged: $isFlagged)';
  }
}

/// @nodoc
abstract mixin class _$VideoCopyWith<$Res> implements $VideoCopyWith<$Res> {
  factory _$VideoCopyWith(_Video value, $Res Function(_Video) _then) =
      __$VideoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String category,
      String coverPhoto,
      DateTime createdAt,
      String description,
      String id,
      bool isPublic,
      List<VideoSummary> relatedVideos,
      String status,
      List<String> tags,
      String title,
      DateTime updatedAt,
      UploaderUser uploader,
      PhysioFile videoFile,
      bool isFlagged});

  @override
  $UploaderUserCopyWith<$Res> get uploader;
}

/// @nodoc
class __$VideoCopyWithImpl<$Res> implements _$VideoCopyWith<$Res> {
  __$VideoCopyWithImpl(this._self, this._then);

  final _Video _self;
  final $Res Function(_Video) _then;

  /// Create a copy of Video
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? category = null,
    Object? coverPhoto = null,
    Object? createdAt = null,
    Object? description = null,
    Object? id = null,
    Object? isPublic = null,
    Object? relatedVideos = null,
    Object? status = null,
    Object? tags = null,
    Object? title = null,
    Object? updatedAt = null,
    Object? uploader = null,
    Object? videoFile = null,
    Object? isFlagged = null,
  }) {
    return _then(_Video(
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      coverPhoto: null == coverPhoto
          ? _self.coverPhoto
          : coverPhoto // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isPublic: null == isPublic
          ? _self.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      relatedVideos: null == relatedVideos
          ? _self._relatedVideos
          : relatedVideos // ignore: cast_nullable_to_non_nullable
              as List<VideoSummary>,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _self._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      uploader: null == uploader
          ? _self.uploader
          : uploader // ignore: cast_nullable_to_non_nullable
              as UploaderUser,
      videoFile: null == videoFile
          ? _self.videoFile
          : videoFile // ignore: cast_nullable_to_non_nullable
              as PhysioFile,
      isFlagged: null == isFlagged
          ? _self.isFlagged
          : isFlagged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of Video
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
