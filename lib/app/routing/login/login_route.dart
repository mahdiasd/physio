import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:login/login.dart';

import '../main/main_route.dart';

part 'login_route.g.dart';

@TypedGoRoute<LoginRoute>(path: "/login")
@immutable
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LoginPage(
      onMain: () => context.push(HomeRoute().location),
    );
  }
}
