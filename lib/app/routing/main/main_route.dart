import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:main/main.dart';

part 'main_route.g.dart';

@TypedShellRoute<MainRoute>(routes: [
  TypedGoRoute<HomeRoute>(path: '/home'),
  TypedGoRoute<LibraryRoute>(path: '/library'),
  TypedGoRoute<ProgramsRoute>(path: '/programs'),
  TypedGoRoute<AppointmentsRoute>(path: '/appointment'),
  TypedGoRoute<AccountRoute>(path: '/account'),
])
@immutable
class MainRoute extends ShellRouteData {
  const MainRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget child) {
    return MainPage(
      child: child,
      onHomePressed: () => HomeRoute().go(context),
      onLibraryPressed: () => LibraryRoute().go(context),
      onProgramsPressed: () => ProgramsRoute().go(context),
      onAppointmentsPressed: () => AppointmentsRoute().go(context),
      onAccountPressed: () => AccountRoute().go(context),
    );
  }
}

class AccountRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Text("AccountRoute");
}

class LibraryRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Text("LibraryRoute");
}

class ProgramsRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Text("ProgramsRoute");
}

class AppointmentsRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Text("AppointmentsRoute");
}

class HomeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Text("HomeRoute");
}