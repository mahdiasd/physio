// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $verifyRoute,
    ];

RouteBase get $verifyRoute => GoRouteData.$route(
      path: '/verify',
      factory: $VerifyRouteExtension._fromState,
    );

extension $VerifyRouteExtension on VerifyRoute {
  static VerifyRoute _fromState(GoRouterState state) => VerifyRoute(
        email: state.uri.queryParameters['email']!,
      );

  String get location => GoRouteData.$location(
        '/verify',
        queryParams: {
          'email': email,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
