import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:physio/app/routing/login/login_route.dart';
import 'package:splash/splash.dart';
import 'package:utils/utils.dart';

import '../main/main_route.dart';

part 'splash_route.g.dart';

@TypedGoRoute<SplashRoute>(path: "/splash")
@immutable
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => getIt<SplashBloc>(),
      child: Builder(
        builder: (innerContext) {
          return SplashPage(
            onLogin: () => innerContext.go(LoginRoute().location),
            onMain: () => innerContext.go(HomeRoute().location),
          );
        },
      ),
    );
  }
}
