// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $forgotRoute,
    ];

RouteBase get $forgotRoute => GoRouteData.$route(
      path: '/forgot',
      factory: $ForgotRouteExtension._fromState,
    );

extension $ForgotRouteExtension on ForgotRoute {
  static ForgotRoute _fromState(GoRouterState state) => const ForgotRoute();

  String get location => GoRouteData.$location(
        '/forgot',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
