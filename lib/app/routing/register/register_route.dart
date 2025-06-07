import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:register/register.dart';

import '../login/login_route.dart';
part 'register_route.g.dart';

@TypedGoRoute<RegisterRoute>(path: "/register")
@immutable
class RegisterRoute extends GoRouteData {
  const RegisterRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => RegisterPage(
        onToLogin: () => LoginRoute(),
      );
} 