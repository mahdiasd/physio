import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:main/main.dart';
import 'package:physio/routing/search/search_route.dart';
import 'package:physio/routing/video_detail/video_detail_route.dart';
import 'package:ui/ui.dart';
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
    final currentNavItem = _getNavigationItemFromPath(state.uri.path);
    final bloc = getIt<MainBloc>();
    return BlocProvider(
      create: (context) {
        bloc.add(PageChanged(currentNavItem));
        PrintHelper.info("${currentNavItem.label}", location: "MainRoute");
        return bloc;
      },
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

  NavigationItem _getNavigationItemFromPath(String path) {
    if (path.startsWith('/home')) {
      return const HomeNavigationItem();
    } else if (path.startsWith('/library')) {
      return const LibraryNavigationItem();
    } else if (path.startsWith('/programs')) {
      return const ProgramsNavigationItem();
    } else if (path.startsWith('/appointment')) {
      return const AppointmentsNavigationItem();
    } else if (path.startsWith('/account')) {
      return const AccountNavigationItem();
    }
    // مسیر پیش‌فرض
    return const LibraryNavigationItem();
  }
}

class AccountRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Text("AccountRoute");
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
              navigateToVideoDetail: (videoId) {
                innerContext.push(VideoDetailRoute(videoId).location);
              },
            );
          },
        ),
      );
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
      const Text("HomeRoute2");
}

extension Navigate on NavigationItem {
  void goTo(BuildContext context) {
    switch (this) {
      case HomeNavigationItem():
        PrintHelper.info('Navigating to Home');
        context.go(HomeRoute().location);
        break;
      case AppointmentsNavigationItem():
        PrintHelper.info('Navigating to Appointments');
        context.go(AppointmentsRoute().location);
        break;
      case ProgramsNavigationItem():
        PrintHelper.info('Navigating to Programs');
        context.go(ProgramsRoute().location);
        break;
      case LibraryNavigationItem():
        PrintHelper.info('Navigating to Library');
        context.go(LibraryRoute().location);
        break;
      case AccountNavigationItem():
        PrintHelper.info('Navigating to Account');
        context.go(AccountRoute().location);
        break;
    }
  }
}
