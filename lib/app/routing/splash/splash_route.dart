import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:physio/app/routing/login/login_route.dart';
import 'package:splash/splash.dart';

import '../main/main_route.dart';

part 'splash_route.g.dart';

@TypedGoRoute<SplashRoute>(path: "/splash")
@immutable
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SplashPage(
      onLogin: () => context.go(LoginRoute().location),
      onMain: () => context.go(HomeRoute().location),
    );
  }
}
