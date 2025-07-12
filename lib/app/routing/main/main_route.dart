import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:main/main.dart';
import 'package:physio/app/routing/search/search_route.dart';
import 'package:utils/utils.dart';
import 'package:video_library/video_library.dart';

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
    return BlocProvider(
      create: (context) => getIt<MainBloc>(),
      child: Builder(
        builder: (innerContext) {
          return MainPage(
            child: child,
            onHomePressed: () => HomeRoute().go(context),
            onLibraryPressed: () => LibraryRoute().go(context),
            onProgramsPressed: () => ProgramsRoute().go(context),
            onAppointmentsPressed: () => AppointmentsRoute().go(context),
            onAccountPressed: () => AccountRoute().go(context),
          );
        },
      ),
    );
  }
}

class AccountRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => const Text("AccountRoute");
}

class LibraryRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => BlocProvider(
        create: (context) => getIt<VideoLibraryBloc>(),
        child: Builder(
          builder: (innerContext) {
            return VideoLibraryPage(
              navigateToSearch: (searchParams) {
                innerContext.push(SearchRouteExtension.fromSearchParams(searchParams).location);
              },
            );
          },
        ),
      );
}

class ProgramsRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => const Text("ProgramsRoute");
}

class AppointmentsRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => const Text("AppointmentsRoute");
}

class HomeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => const Text("HomeRoute");
}
