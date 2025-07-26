// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: type=lint, unnecessary_cast, unused_local_variable

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart' as _i1;
import 'package:domain/src/model/blog_post/blog_post.dart' as _i6;
import 'package:domain/src/model/config/config.dart' as _i12;
import 'package:domain/src/model/config/update/update.dart' as _i14;
import 'package:domain/src/model/file/physio_file.dart' as _i10;
import 'package:domain/src/model/library/VideoLibrary.dart' as _i18;
import 'package:domain/src/model/user/user.dart' as _i3;
import 'package:domain/src/model/video/uploader_user.dart' as _i8;
import 'package:domain/src/model/video/video.dart' as _i20;
import 'package:domain/src/model/video/video_summary.dart' as _i16;
import 'package:network/src/dto/blog_post/blog_post_response.dart' as _i5;
import 'package:network/src/dto/config/config_response.dart' as _i11;
import 'package:network/src/dto/config/update_response.dart' as _i13;
import 'package:network/src/dto/file/file_response.dart' as _i9;
import 'package:network/src/dto/library/video_library_response.dart' as _i17;
import 'package:network/src/dto/user/register_response.dart' as _i4;
import 'package:network/src/dto/user/user_response.dart' as _i2;
import 'package:network/src/dto/video/uploader_user_response.dart' as _i7;
import 'package:network/src/dto/video/video_response.dart' as _i19;
import 'package:network/src/dto/video/video_summary_response.dart' as _i15;

import 'mapper.dart' as _i21;

/// {@template package:data/src/mapper/mapper.dart}
/// Available mappings:
/// - `UserResponse` → `User`.
/// - `RegisterResponse` → `User`.
/// - `BlogPostResponse` → `BlogPost`.
/// - `UploaderUserResponse` → `UploaderUser`.
/// - `FileResponse` → `PhysioFile`.
/// - `ConfigResponse` → `Config`.
/// - `UpdateResponse` → `Update`.
/// - `VideoSummaryResponse` → `VideoSummary`.
/// - `VideoLibraryResponse` → `VideoLibrary`.
/// - `VideoResponse` → `Video`.
/// {@endtemplate}
class $Mappr implements _i1.AutoMapprInterface {
  const $Mappr();

  Type _typeOf<T>() => T;

  List<_i1.AutoMapprInterface> get _delegates => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:data/src/mapper/mapper.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.UserResponse>() ||
            sourceTypeOf == _typeOf<_i2.UserResponse?>()) &&
        (targetTypeOf == _typeOf<_i3.User>() ||
            targetTypeOf == _typeOf<_i3.User?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i4.RegisterResponse>() ||
            sourceTypeOf == _typeOf<_i4.RegisterResponse?>()) &&
        (targetTypeOf == _typeOf<_i3.User>() ||
            targetTypeOf == _typeOf<_i3.User?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i5.BlogPostResponse>() ||
            sourceTypeOf == _typeOf<_i5.BlogPostResponse?>()) &&
        (targetTypeOf == _typeOf<_i6.BlogPost>() ||
            targetTypeOf == _typeOf<_i6.BlogPost?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i7.UploaderUserResponse>() ||
            sourceTypeOf == _typeOf<_i7.UploaderUserResponse?>()) &&
        (targetTypeOf == _typeOf<_i8.UploaderUser>() ||
            targetTypeOf == _typeOf<_i8.UploaderUser?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i9.FileResponse>() ||
            sourceTypeOf == _typeOf<_i9.FileResponse?>()) &&
        (targetTypeOf == _typeOf<_i10.PhysioFile>() ||
            targetTypeOf == _typeOf<_i10.PhysioFile?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i11.ConfigResponse>() ||
            sourceTypeOf == _typeOf<_i11.ConfigResponse?>()) &&
        (targetTypeOf == _typeOf<_i12.Config>() ||
            targetTypeOf == _typeOf<_i12.Config?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i13.UpdateResponse>() ||
            sourceTypeOf == _typeOf<_i13.UpdateResponse?>()) &&
        (targetTypeOf == _typeOf<_i14.Update>() ||
            targetTypeOf == _typeOf<_i14.Update?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i15.VideoSummaryResponse>() ||
            sourceTypeOf == _typeOf<_i15.VideoSummaryResponse?>()) &&
        (targetTypeOf == _typeOf<_i16.VideoSummary>() ||
            targetTypeOf == _typeOf<_i16.VideoSummary?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i17.VideoLibraryResponse>() ||
            sourceTypeOf == _typeOf<_i17.VideoLibraryResponse?>()) &&
        (targetTypeOf == _typeOf<_i18.VideoLibrary>() ||
            targetTypeOf == _typeOf<_i18.VideoLibrary?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i19.VideoResponse>() ||
            sourceTypeOf == _typeOf<_i19.VideoResponse?>()) &&
        (targetTypeOf == _typeOf<_i20.Video>() ||
            targetTypeOf == _typeOf<_i20.Video?>())) {
      return true;
    }
    if (recursive) {
      for (final mappr in _delegates) {
        if (mappr.canConvert<SOURCE, TARGET>()) {
          return true;
        }
      }
    }
    return false;
  }

  /// {@macro AutoMapprInterface:convert}
  /// {@macro package:data/src/mapper/mapper.dart}
  @override
  TARGET convert<SOURCE, TARGET>(SOURCE? model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return _convert(model)!;
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convert(model)!;
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:tryConvert}
  /// {@macro package:data/src/mapper/mapper.dart}
  @override
  TARGET? tryConvert<SOURCE, TARGET>(
    SOURCE? model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
        onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return _safeConvert(
        model,
        onMappingError: onMappingError,
      );
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvert(
          model,
          onMappingError: onMappingError,
        );
      }
    }

    return null;
  }

  /// {@macro AutoMapprInterface:convertIterable}
  /// {@macro package:data/src/mapper/mapper.dart}
  @override
  Iterable<TARGET> convertIterable<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return model.map<TARGET>((item) => _convert(item)!);
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertIterable(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into Iterable.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:data/src/mapper/mapper.dart}
  @override
  Iterable<TARGET?> tryConvertIterable<SOURCE, TARGET>(
    Iterable<SOURCE?> model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
        onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return model.map<TARGET?>(
          (item) => _safeConvert(item, onMappingError: onMappingError));
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertIterable(
          model,
          onMappingError: onMappingError,
        );
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:convertList}
  /// {@macro package:data/src/mapper/mapper.dart}
  @override
  List<TARGET> convertList<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return convertIterable<SOURCE, TARGET>(model).toList();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertList(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into List.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:data/src/mapper/mapper.dart}
  @override
  List<TARGET?> tryConvertList<SOURCE, TARGET>(
    Iterable<SOURCE?> model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
        onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(
        model,
        onMappingError: onMappingError,
      ).toList();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertList(
          model,
          onMappingError: onMappingError,
        );
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:convertSet}
  /// {@macro package:data/src/mapper/mapper.dart}
  @override
  Set<TARGET> convertSet<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return convertIterable<SOURCE, TARGET>(model).toSet();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertSet(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into Set.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:data/src/mapper/mapper.dart}
  @override
  Set<TARGET?> tryConvertSet<SOURCE, TARGET>(
    Iterable<SOURCE?> model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
        onMappingError,
  }) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(
        model,
        onMappingError: onMappingError,
      ).toSet();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertSet(
          model,
          onMappingError: onMappingError,
        );
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  TARGET? _convert<SOURCE, TARGET>(
    SOURCE? model, {
    bool canReturnNull = false,
  }) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.UserResponse>() ||
            sourceTypeOf == _typeOf<_i2.UserResponse?>()) &&
        (targetTypeOf == _typeOf<_i3.User>() ||
            targetTypeOf == _typeOf<_i3.User?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$UserResponse_To__i3$User((model as _i2.UserResponse?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i4.RegisterResponse>() ||
            sourceTypeOf == _typeOf<_i4.RegisterResponse?>()) &&
        (targetTypeOf == _typeOf<_i3.User>() ||
            targetTypeOf == _typeOf<_i3.User?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i4$RegisterResponse_To__i3$User(
          (model as _i4.RegisterResponse?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i5.BlogPostResponse>() ||
            sourceTypeOf == _typeOf<_i5.BlogPostResponse?>()) &&
        (targetTypeOf == _typeOf<_i6.BlogPost>() ||
            targetTypeOf == _typeOf<_i6.BlogPost?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i5$BlogPostResponse_To__i6$BlogPost(
          (model as _i5.BlogPostResponse?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i7.UploaderUserResponse>() ||
            sourceTypeOf == _typeOf<_i7.UploaderUserResponse?>()) &&
        (targetTypeOf == _typeOf<_i8.UploaderUser>() ||
            targetTypeOf == _typeOf<_i8.UploaderUser?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i7$UploaderUserResponse_To__i8$UploaderUser(
          (model as _i7.UploaderUserResponse?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i9.FileResponse>() ||
            sourceTypeOf == _typeOf<_i9.FileResponse?>()) &&
        (targetTypeOf == _typeOf<_i10.PhysioFile>() ||
            targetTypeOf == _typeOf<_i10.PhysioFile?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i9$FileResponse_To__i10$PhysioFile(
          (model as _i9.FileResponse?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i11.ConfigResponse>() ||
            sourceTypeOf == _typeOf<_i11.ConfigResponse?>()) &&
        (targetTypeOf == _typeOf<_i12.Config>() ||
            targetTypeOf == _typeOf<_i12.Config?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i11$ConfigResponse_To__i12$Config(
          (model as _i11.ConfigResponse?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i13.UpdateResponse>() ||
            sourceTypeOf == _typeOf<_i13.UpdateResponse?>()) &&
        (targetTypeOf == _typeOf<_i14.Update>() ||
            targetTypeOf == _typeOf<_i14.Update?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i13$UpdateResponse_To__i14$Update(
          (model as _i13.UpdateResponse?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i15.VideoSummaryResponse>() ||
            sourceTypeOf == _typeOf<_i15.VideoSummaryResponse?>()) &&
        (targetTypeOf == _typeOf<_i16.VideoSummary>() ||
            targetTypeOf == _typeOf<_i16.VideoSummary?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i15$VideoSummaryResponse_To__i16$VideoSummary(
          (model as _i15.VideoSummaryResponse?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i17.VideoLibraryResponse>() ||
            sourceTypeOf == _typeOf<_i17.VideoLibraryResponse?>()) &&
        (targetTypeOf == _typeOf<_i18.VideoLibrary>() ||
            targetTypeOf == _typeOf<_i18.VideoLibrary?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i17$VideoLibraryResponse_To__i18$VideoLibrary(
          (model as _i17.VideoLibraryResponse?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i19.VideoResponse>() ||
            sourceTypeOf == _typeOf<_i19.VideoResponse?>()) &&
        (targetTypeOf == _typeOf<_i20.Video>() ||
            targetTypeOf == _typeOf<_i20.Video?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i19$VideoResponse_To__i20$Video(
          (model as _i19.VideoResponse?)) as TARGET);
    }
    throw Exception('No ${model.runtimeType} -> $targetTypeOf mapping.');
  }

  TARGET? _safeConvert<SOURCE, TARGET>(
    SOURCE? model, {
    void Function(Object error, StackTrace stackTrace, SOURCE? source)?
        onMappingError,
  }) {
    if (!useSafeMapping<SOURCE, TARGET>()) {
      return _convert(
        model,
        canReturnNull: true,
      );
    }
    try {
      return _convert(
        model,
        canReturnNull: true,
      );
    } catch (e, s) {
      onMappingError?.call(e, s, model);
      return null;
    }
  }

  /// {@macro AutoMapprInterface:useSafeMapping}
  /// {@macro package:data/src/mapper/mapper.dart}
  @override
  bool useSafeMapping<SOURCE, TARGET>() {
    return false;
  }

  _i3.User _map__i2$UserResponse_To__i3$User(_i2.UserResponse? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping UserResponse → User failed because UserResponse was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<UserResponse, User> to handle null values during mapping.');
    }
    return _i3.User(
      id: model.id,
      email: model.email,
      firstName: model.firstName,
      lastName: model.lastName,
      role: _i21.Mappr.convertUserRole(model),
      status: model.status,
    );
  }

  _i3.User _map__i4$RegisterResponse_To__i3$User(_i4.RegisterResponse? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping RegisterResponse → User failed because RegisterResponse was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<RegisterResponse, User> to handle null values during mapping.');
    }
    return _i3.User(
      id: _i21.Mappr.convertNullableString(model),
      email: _i21.Mappr.convertNullableString(model),
      firstName: _i21.Mappr.convertNullableString(model),
      lastName: _i21.Mappr.convertNullableString(model),
      role: _i21.Mappr.convertUserRole(model),
      status: model.status,
    );
  }

  _i6.BlogPost _map__i5$BlogPostResponse_To__i6$BlogPost(
      _i5.BlogPostResponse? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping BlogPostResponse → BlogPost failed because BlogPostResponse was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<BlogPostResponse, BlogPost> to handle null values during mapping.');
    }
    return _i6.BlogPost(
      id: model.id,
      author: _map__i2$UserResponse_To__i3$User(model.author),
      title: model.title,
      slug: model.slug,
      excerpt: model.excerpt,
      content: model.content,
      featuredImage: model.featuredImage,
      status: _i21.Mappr.convertPostStatus(model),
      publishedAt: model.publishedAt,
      viewCount: model.viewCount,
      createdAt: model.createdAt,
    );
  }

  _i8.UploaderUser _map__i7$UploaderUserResponse_To__i8$UploaderUser(
      _i7.UploaderUserResponse? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping UploaderUserResponse → UploaderUser failed because UploaderUserResponse was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<UploaderUserResponse, UploaderUser> to handle null values during mapping.');
    }
    return _i8.UploaderUser(
      firstName: model.firstName,
      lastName: model.lastName,
    );
  }

  _i10.PhysioFile _map__i9$FileResponse_To__i10$PhysioFile(
      _i9.FileResponse? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping FileResponse → PhysioFile failed because FileResponse was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<FileResponse, PhysioFile> to handle null values during mapping.');
    }
    return _i10.PhysioFile(
      contentType: model.contentType,
      fileCategory: model.fileCategory,
      fileSize: model.fileSize,
      id: model.id,
      originalFilename: model.originalFilename,
      s3Url: model.s3Url,
      storagePath: model.storagePath,
      storageType: model.storageType,
      storedFilename: model.storedFilename,
      uploadedBy: model.uploadedBy,
      url: model.url,
    );
  }

  _i12.Config _map__i11$ConfigResponse_To__i12$Config(
      _i11.ConfigResponse? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping ConfigResponse → Config failed because ConfigResponse was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<ConfigResponse, Config> to handle null values during mapping.');
    }
    return _i12.Config(
        update: _map__i13$UpdateResponse_To__i14$Update(model.update));
  }

  _i14.Update _map__i13$UpdateResponse_To__i14$Update(
      _i13.UpdateResponse? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping UpdateResponse → Update failed because UpdateResponse was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<UpdateResponse, Update> to handle null values during mapping.');
    }
    return _i14.Update(
      forceVersion: model.forceVersion,
      lastVersion: model.lastVersion,
      suggestVersion: model.suggestVersion,
      message: model.message,
      googlePlayUrl: model.googlePlayUrl,
      appStorePlayUrl: model.appStorePlayUrl,
    );
  }

  _i16.VideoSummary _map__i15$VideoSummaryResponse_To__i16$VideoSummary(
      _i15.VideoSummaryResponse? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping VideoSummaryResponse → VideoSummary failed because VideoSummaryResponse was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<VideoSummaryResponse, VideoSummary> to handle null values during mapping.');
    }
    return _i16.VideoSummary(
      id: model.id,
      title: model.title,
      description: model.description,
      coverPhoto: model.coverPhoto,
      viewCount: model.viewCount,
      category: model.category,
      uploader:
          _map__i7$UploaderUserResponse_To__i8$UploaderUser(model.uploader),
    );
  }

  _i18.VideoLibrary _map__i17$VideoLibraryResponse_To__i18$VideoLibrary(
      _i17.VideoLibraryResponse? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping VideoLibraryResponse → VideoLibrary failed because VideoLibraryResponse was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<VideoLibraryResponse, VideoLibrary> to handle null values during mapping.');
    }
    return _i18.VideoLibrary(
      categories: model.categories,
      mainVideo: _map__i15$VideoSummaryResponse_To__i16$VideoSummary_Nullable(
          model.mainVideo),
      recentVideos: model.recentVideos
          ?.map<_i16.VideoSummary>((value) =>
              _map__i15$VideoSummaryResponse_To__i16$VideoSummary(value))
          .toList(),
      mostVideos: model.mostVideos
          ?.map<_i16.VideoSummary>((value) =>
              _map__i15$VideoSummaryResponse_To__i16$VideoSummary(value))
          .toList(),
      shouldersVideos: model.shouldersVideos
          ?.map<_i16.VideoSummary>((value) =>
              _map__i15$VideoSummaryResponse_To__i16$VideoSummary(value))
          .toList(),
      blogPosts: model.blogPosts
          ?.map<_i6.BlogPost>(
              (value) => _map__i5$BlogPostResponse_To__i6$BlogPost(value))
          .toList(),
    );
  }

  _i20.Video _map__i19$VideoResponse_To__i20$Video(_i19.VideoResponse? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping VideoResponse → Video failed because VideoResponse was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<VideoResponse, Video> to handle null values during mapping.');
    }
    return _i20.Video(
      category: model.category,
      coverPhoto: model.coverPhoto,
      createdAt: model.createdAt,
      description: model.description,
      id: model.id,
      isPublic: model.isPublic,
      relatedVideos: model.relatedVideos
          .map<_i16.VideoSummary>((value) =>
              _map__i15$VideoSummaryResponse_To__i16$VideoSummary(value))
          .toList(),
      isFlagged: _i21.Mappr.convertFlagsToIsFlagged(model),
      status: model.status,
      tags: model.tags,
      title: model.title,
      updatedAt: model.updatedAt,
      uploader:
          _map__i7$UploaderUserResponse_To__i8$UploaderUser(model.uploader),
      videoFile: _map__i9$FileResponse_To__i10$PhysioFile(model.videoFile),
    );
  }

  _i16.VideoSummary?
      _map__i15$VideoSummaryResponse_To__i16$VideoSummary_Nullable(
          _i15.VideoSummaryResponse? input) {
    final model = input;
    if (model == null) {
      return null;
    }
    return _i16.VideoSummary(
      id: model.id,
      title: model.title,
      description: model.description,
      coverPhoto: model.coverPhoto,
      viewCount: model.viewCount,
      category: model.category,
      uploader:
          _map__i7$UploaderUserResponse_To__i8$UploaderUser(model.uploader),
    );
  }
}
