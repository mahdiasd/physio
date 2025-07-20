// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: type=lint, unnecessary_cast, unused_local_variable

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart' as _i1;
import 'package:domain/src/model/blog_post/blog_post.dart' as _i7;
import 'package:domain/src/model/config/config.dart' as _i15;
import 'package:domain/src/model/config/update/update.dart' as _i17;
import 'package:domain/src/model/library/VideoLibrary.dart' as _i13;
import 'package:domain/src/model/user/user.dart' as _i3;
import 'package:domain/src/model/video/uploader_user.dart' as _i9;
import 'package:domain/src/model/video/video_summary.dart' as _i11;
import 'package:network/src/dto/blog_post/blog_post_response.dart' as _i6;
import 'package:network/src/dto/config/config_response.dart' as _i14;
import 'package:network/src/dto/config/update_response.dart' as _i16;
import 'package:network/src/dto/library/video_library_response.dart' as _i12;
import 'package:network/src/dto/user/login_response.dart' as _i4;
import 'package:network/src/dto/user/register_response.dart' as _i5;
import 'package:network/src/dto/user/user_response.dart' as _i2;
import 'package:network/src/dto/video/uploader_user_response.dart' as _i8;
import 'package:network/src/dto/video/video_summary_response.dart' as _i10;

import 'mapper.dart' as _i18;

/// {@template package:data/src/mapper/mapper.dart}
/// Available mappings:
/// - `UserResponse` → `User`.
/// - `LoginResponse` → `User`.
/// - `RegisterResponse` → `User`.
/// - `BlogPostResponse` → `BlogPost`.
/// - `UploaderUserResponse` → `UploaderUser`.
/// - `VideoSummaryResponse` → `VideoSummary`.
/// - `VideoLibraryResponse` → `VideoLibrary`.
/// - `ConfigResponse` → `Config`.
/// - `UpdateResponse` → `Update`.
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
    if ((sourceTypeOf == _typeOf<_i4.LoginResponse>() ||
            sourceTypeOf == _typeOf<_i4.LoginResponse?>()) &&
        (targetTypeOf == _typeOf<_i3.User>() ||
            targetTypeOf == _typeOf<_i3.User?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i5.RegisterResponse>() ||
            sourceTypeOf == _typeOf<_i5.RegisterResponse?>()) &&
        (targetTypeOf == _typeOf<_i3.User>() ||
            targetTypeOf == _typeOf<_i3.User?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i6.BlogPostResponse>() ||
            sourceTypeOf == _typeOf<_i6.BlogPostResponse?>()) &&
        (targetTypeOf == _typeOf<_i7.BlogPost>() ||
            targetTypeOf == _typeOf<_i7.BlogPost?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i8.UploaderUserResponse>() ||
            sourceTypeOf == _typeOf<_i8.UploaderUserResponse?>()) &&
        (targetTypeOf == _typeOf<_i9.UploaderUser>() ||
            targetTypeOf == _typeOf<_i9.UploaderUser?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i10.VideoSummaryResponse>() ||
            sourceTypeOf == _typeOf<_i10.VideoSummaryResponse?>()) &&
        (targetTypeOf == _typeOf<_i11.VideoSummary>() ||
            targetTypeOf == _typeOf<_i11.VideoSummary?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i12.VideoLibraryResponse>() ||
            sourceTypeOf == _typeOf<_i12.VideoLibraryResponse?>()) &&
        (targetTypeOf == _typeOf<_i13.VideoLibrary>() ||
            targetTypeOf == _typeOf<_i13.VideoLibrary?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i14.ConfigResponse>() ||
            sourceTypeOf == _typeOf<_i14.ConfigResponse?>()) &&
        (targetTypeOf == _typeOf<_i15.Config>() ||
            targetTypeOf == _typeOf<_i15.Config?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i16.UpdateResponse>() ||
            sourceTypeOf == _typeOf<_i16.UpdateResponse?>()) &&
        (targetTypeOf == _typeOf<_i17.Update>() ||
            targetTypeOf == _typeOf<_i17.Update?>())) {
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
    if ((sourceTypeOf == _typeOf<_i4.LoginResponse>() ||
            sourceTypeOf == _typeOf<_i4.LoginResponse?>()) &&
        (targetTypeOf == _typeOf<_i3.User>() ||
            targetTypeOf == _typeOf<_i3.User?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i4$LoginResponse_To__i3$User((model as _i4.LoginResponse?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i5.RegisterResponse>() ||
            sourceTypeOf == _typeOf<_i5.RegisterResponse?>()) &&
        (targetTypeOf == _typeOf<_i3.User>() ||
            targetTypeOf == _typeOf<_i3.User?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i5$RegisterResponse_To__i3$User(
          (model as _i5.RegisterResponse?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i6.BlogPostResponse>() ||
            sourceTypeOf == _typeOf<_i6.BlogPostResponse?>()) &&
        (targetTypeOf == _typeOf<_i7.BlogPost>() ||
            targetTypeOf == _typeOf<_i7.BlogPost?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i6$BlogPostResponse_To__i7$BlogPost(
          (model as _i6.BlogPostResponse?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i8.UploaderUserResponse>() ||
            sourceTypeOf == _typeOf<_i8.UploaderUserResponse?>()) &&
        (targetTypeOf == _typeOf<_i9.UploaderUser>() ||
            targetTypeOf == _typeOf<_i9.UploaderUser?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i8$UploaderUserResponse_To__i9$UploaderUser(
          (model as _i8.UploaderUserResponse?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i10.VideoSummaryResponse>() ||
            sourceTypeOf == _typeOf<_i10.VideoSummaryResponse?>()) &&
        (targetTypeOf == _typeOf<_i11.VideoSummary>() ||
            targetTypeOf == _typeOf<_i11.VideoSummary?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i10$VideoSummaryResponse_To__i11$VideoSummary(
          (model as _i10.VideoSummaryResponse?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i12.VideoLibraryResponse>() ||
            sourceTypeOf == _typeOf<_i12.VideoLibraryResponse?>()) &&
        (targetTypeOf == _typeOf<_i13.VideoLibrary>() ||
            targetTypeOf == _typeOf<_i13.VideoLibrary?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i12$VideoLibraryResponse_To__i13$VideoLibrary(
          (model as _i12.VideoLibraryResponse?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i14.ConfigResponse>() ||
            sourceTypeOf == _typeOf<_i14.ConfigResponse?>()) &&
        (targetTypeOf == _typeOf<_i15.Config>() ||
            targetTypeOf == _typeOf<_i15.Config?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i14$ConfigResponse_To__i15$Config(
          (model as _i14.ConfigResponse?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i16.UpdateResponse>() ||
            sourceTypeOf == _typeOf<_i16.UpdateResponse?>()) &&
        (targetTypeOf == _typeOf<_i17.Update>() ||
            targetTypeOf == _typeOf<_i17.Update?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i16$UpdateResponse_To__i17$Update(
          (model as _i16.UpdateResponse?)) as TARGET);
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
      role: _i18.Mappr.convertUserRole(model),
      status: model.status,
    );
  }

  _i3.User _map__i4$LoginResponse_To__i3$User(_i4.LoginResponse? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping LoginResponse → User failed because LoginResponse was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<LoginResponse, User> to handle null values during mapping.');
    }
    return _i3.User(
      id: _i18.Mappr.convertNullableString(model),
      email: _i18.Mappr.convertNullableString(model),
      firstName: _i18.Mappr.convertNullableString(model),
      lastName: _i18.Mappr.convertNullableString(model),
      role: _i18.Mappr.convertUserRole(model),
    );
  }

  _i3.User _map__i5$RegisterResponse_To__i3$User(_i5.RegisterResponse? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping RegisterResponse → User failed because RegisterResponse was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<RegisterResponse, User> to handle null values during mapping.');
    }
    return _i3.User(
      id: _i18.Mappr.convertNullableString(model),
      email: _i18.Mappr.convertNullableString(model),
      firstName: _i18.Mappr.convertNullableString(model),
      lastName: _i18.Mappr.convertNullableString(model),
      role: _i18.Mappr.convertUserRole(model),
      status: model.status,
    );
  }

  _i7.BlogPost _map__i6$BlogPostResponse_To__i7$BlogPost(
      _i6.BlogPostResponse? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping BlogPostResponse → BlogPost failed because BlogPostResponse was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<BlogPostResponse, BlogPost> to handle null values during mapping.');
    }
    return _i7.BlogPost(
      id: model.id,
      author: _map__i2$UserResponse_To__i3$User(model.author),
      title: model.title,
      slug: model.slug,
      excerpt: model.excerpt,
      content: model.content,
      featuredImage: model.featuredImage,
      status: _i18.Mappr.convertPostStatus(model),
      publishedAt: model.publishedAt,
      viewCount: model.viewCount,
      createdAt: model.createdAt,
    );
  }

  _i9.UploaderUser _map__i8$UploaderUserResponse_To__i9$UploaderUser(
      _i8.UploaderUserResponse? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping UploaderUserResponse → UploaderUser failed because UploaderUserResponse was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<UploaderUserResponse, UploaderUser> to handle null values during mapping.');
    }
    return _i9.UploaderUser(
      firstName: model.firstName,
      lastName: model.lastName,
    );
  }

  _i11.VideoSummary _map__i10$VideoSummaryResponse_To__i11$VideoSummary(
      _i10.VideoSummaryResponse? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping VideoSummaryResponse → VideoSummary failed because VideoSummaryResponse was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<VideoSummaryResponse, VideoSummary> to handle null values during mapping.');
    }
    return _i11.VideoSummary(
      id: model.id,
      title: model.title,
      description: model.description,
      coverPhoto: model.coverPhoto,
      viewCount: model.viewCount,
      category: model.category,
      uploader:
          _map__i8$UploaderUserResponse_To__i9$UploaderUser(model.uploader),
    );
  }

  _i13.VideoLibrary _map__i12$VideoLibraryResponse_To__i13$VideoLibrary(
      _i12.VideoLibraryResponse? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping VideoLibraryResponse → VideoLibrary failed because VideoLibraryResponse was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<VideoLibraryResponse, VideoLibrary> to handle null values during mapping.');
    }
    return _i13.VideoLibrary(
      categories: model.categories,
      mainVideo: _map__i10$VideoSummaryResponse_To__i11$VideoSummary_Nullable(
          model.mainVideo),
      recentVideos: model.recentVideos
          ?.map<_i11.VideoSummary>((value) =>
              _map__i10$VideoSummaryResponse_To__i11$VideoSummary(value))
          .toList(),
      mostVideos: model.mostVideos
          ?.map<_i11.VideoSummary>((value) =>
              _map__i10$VideoSummaryResponse_To__i11$VideoSummary(value))
          .toList(),
      shouldersVideos: model.shouldersVideos
          ?.map<_i11.VideoSummary>((value) =>
              _map__i10$VideoSummaryResponse_To__i11$VideoSummary(value))
          .toList(),
      blogPosts: model.blogPosts
          ?.map<_i7.BlogPost>(
              (value) => _map__i6$BlogPostResponse_To__i7$BlogPost(value))
          .toList(),
    );
  }

  _i15.Config _map__i14$ConfigResponse_To__i15$Config(
      _i14.ConfigResponse? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping ConfigResponse → Config failed because ConfigResponse was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<ConfigResponse, Config> to handle null values during mapping.');
    }
    return _i15.Config(
        update: _map__i16$UpdateResponse_To__i17$Update(model.update));
  }

  _i17.Update _map__i16$UpdateResponse_To__i17$Update(
      _i16.UpdateResponse? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping UpdateResponse → Update failed because UpdateResponse was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<UpdateResponse, Update> to handle null values during mapping.');
    }
    return _i17.Update(
      forceVersion: model.forceVersion,
      lastVersion: model.lastVersion,
      suggestVersion: model.suggestVersion,
      message: model.message,
      googlePlayUrl: model.googlePlayUrl,
      appStorePlayUrl: model.appStorePlayUrl,
    );
  }

  _i11.VideoSummary?
      _map__i10$VideoSummaryResponse_To__i11$VideoSummary_Nullable(
          _i10.VideoSummaryResponse? input) {
    final model = input;
    if (model == null) {
      return null;
    }
    return _i11.VideoSummary(
      id: model.id,
      title: model.title,
      description: model.description,
      coverPhoto: model.coverPhoto,
      viewCount: model.viewCount,
      category: model.category,
      uploader:
          _map__i8$UploaderUserResponse_To__i9$UploaderUser(model.uploader),
    );
  }
}
