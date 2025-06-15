import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:physio/app/routing/login/login_route.dart';
import 'package:splash/splash.dart';
import 'package:utils/utils.dart';

import '../main/main_route.dart';

part 'splash_route.g.dart';

// @TypedGoRoute<SplashRoute>(path: "/splash")
// @immutable
// class SplashRoute extends GoRouteData {
//   const SplashRoute();
//
//   @override
//   Widget build(BuildContext context, GoRouterState state) {
//     return SplashPage(
//       onLogin: () => context.push(SplashRoute().location),
//       onMain: () => context.push(HomeRoute().location),
//     );
//   }
// }

@TypedGoRoute<SplashRoute>(path: "/splash")
@immutable
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider( // <-- BlocProvider را اینجا قرار می‌دهیم
      create: (context) => getIt<SplashBloc>(),
      child: Builder( // Builder برای دسترسی به BlocProvider تازه ساخته شده
        builder: (innerContext) {
          return SplashPage(
            onLogin: () => innerContext.go(LoginRoute().location), // از innerContext استفاده کنید
            onMain: () => innerContext.go(HomeRoute().location), // از innerContext استفاده کنید
          );
        },
      ),
    );
  }
}
