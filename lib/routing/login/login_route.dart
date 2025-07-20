import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:login/login.dart';
import 'package:physio/routing/forgot/forgot_route.dart';
import 'package:physio/routing/register/register_route.dart';
import 'package:physio/routing/reset_password/reset_password_route.dart';
import 'package:physio/routing/verify/verify_route.dart';
import 'package:utils/utils.dart';

import '../main/main_route.dart';

part 'login_route.g.dart';

@TypedGoRoute<LoginRoute>(path: "/login")
@immutable
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final bloc = getIt<LoginBloc>();
    return BlocProvider(
      create: (context) => bloc,
      child: Builder(
        builder: (innerContext) {
          return LoginPage(
            navigateToMain: () => innerContext.go(HomeRoute().location),
            navigateBack: () => innerContext.pop(),
            navigateToRegister: () {
              innerContext.push(RegisterRoute().location);
            },
            navigateToForgotPassword: () {
              innerContext.push(ForgotRoute().location);
            },
            navigateToVerify: () {
              innerContext.push(VerifyRoute(bloc.state.email).location);
            },
            navigateToResetPassword: () {
              innerContext.go(ResetPasswordRoute(bloc.state.email).location);
            },
          );
        },
      ),
    );
  }
}
