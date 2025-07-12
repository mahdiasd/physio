// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $searchRoute,
    ];

RouteBase get $searchRoute => GoRouteData.$route(
      path: '/search',
      factory: $SearchRouteExtension._fromState,
    );

extension $SearchRouteExtension on SearchRoute {
  static SearchRoute _fromState(GoRouterState state) => SearchRoute(
        videoCategoryId: state.uri.queryParameters['video-category-id'],
        recentVideos: _$convertMapValue(
            'recent-videos', state.uri.queryParameters, _$boolConverter),
        popularVideos: _$convertMapValue(
            'popular-videos', state.uri.queryParameters, _$boolConverter),
        shouldersVideos: _$convertMapValue(
            'shoulders-videos', state.uri.queryParameters, _$boolConverter),
      );

  String get location => GoRouteData.$location(
        '/search',
        queryParams: {
          if (videoCategoryId != null) 'video-category-id': videoCategoryId,
          if (recentVideos != null) 'recent-videos': recentVideos!.toString(),
          if (popularVideos != null)
            'popular-videos': popularVideos!.toString(),
          if (shouldersVideos != null)
            'shoulders-videos': shouldersVideos!.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T? Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}

bool _$boolConverter(String value) {
  switch (value) {
    case 'true':
      return true;
    case 'false':
      return false;
    default:
      throw UnsupportedError('Cannot convert "$value" into a bool.');
  }
}
