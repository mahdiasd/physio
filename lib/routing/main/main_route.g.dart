// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $mainRoute,
    ];

RouteBase get $mainRoute => ShellRouteData.$route(
      factory: $MainRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/home',
          factory: $HomeRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/library',
          factory: $LibraryRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/programs',
          factory: $ProgramsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/appointment',
          factory: $AppointmentsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/account',
          factory: $AccountRouteExtension._fromState,
        ),
      ],
    );

extension $MainRouteExtension on MainRoute {
  static MainRoute _fromState(GoRouterState state) => const MainRoute();
}

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => HomeRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LibraryRouteExtension on LibraryRoute {
  static LibraryRoute _fromState(GoRouterState state) => LibraryRoute();

  String get location => GoRouteData.$location(
        '/library',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProgramsRouteExtension on ProgramsRoute {
  static ProgramsRoute _fromState(GoRouterState state) => ProgramsRoute();

  String get location => GoRouteData.$location(
        '/programs',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AppointmentsRouteExtension on AppointmentsRoute {
  static AppointmentsRoute _fromState(GoRouterState state) =>
      AppointmentsRoute();

  String get location => GoRouteData.$location(
        '/appointment',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AccountRouteExtension on AccountRoute {
  static AccountRoute _fromState(GoRouterState state) => AccountRoute();

  String get location => GoRouteData.$location(
        '/account',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
