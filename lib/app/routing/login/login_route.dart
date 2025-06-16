import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:login/login.dart';
import 'package:utils/utils.dart';

import '../main/main_route.dart';

part 'login_route.g.dart';

@TypedGoRoute<LoginRoute>(path: "/login")
@immutable
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => getIt<LoginBloc>(),
      child: Builder(
        builder: (innerContext) {
          return LoginPage(
            onMain: () => innerContext.go(HomeRoute().location),
          );
        },
      ),
    );
  }
}
