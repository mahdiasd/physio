// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $resetPasswordRoute,
    ];

RouteBase get $resetPasswordRoute => GoRouteData.$route(
      path: '/reset_password',
      factory: $ResetPasswordRouteExtension._fromState,
    );

extension $ResetPasswordRouteExtension on ResetPasswordRoute {
  static ResetPasswordRoute _fromState(GoRouterState state) =>
      ResetPasswordRoute(
        state.uri.queryParameters['email'],
      );

  String get location => GoRouteData.$location(
        '/reset_password',
        queryParams: {
          if (email != null) 'email': email,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
