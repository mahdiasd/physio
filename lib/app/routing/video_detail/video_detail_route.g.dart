// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_detail_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $videoDetailRoute,
    ];

RouteBase get $videoDetailRoute => GoRouteData.$route(
      path: '/video_detail',
      factory: $VideoDetailRouteExtension._fromState,
    );

extension $VideoDetailRouteExtension on VideoDetailRoute {
  static VideoDetailRoute _fromState(GoRouterState state) => VideoDetailRoute(
        state.uri.queryParameters['video-id'],
      );

  String get location => GoRouteData.$location(
        '/video_detail',
        queryParams: {
          if (videoId != null) 'video-id': videoId,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
