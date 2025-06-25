import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:reset_password/reset_password.dart';
import 'package:utils/utils.dart';

import '../main/main_route.dart';

part 'reset_password_route.g.dart';

@TypedGoRoute<ResetPasswordRoute>(path: "/reset-password")
@immutable
class ResetPasswordRoute extends GoRouteData {
  final String email;
  const ResetPasswordRoute(this.email);

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => getIt<ResetPasswordBloc>(),
      child: Builder(
        builder: (innerContext) {
          return ResetPasswordPage(
            navigateBack: () => innerContext.pop(),
            navigateToMain: () {
              HomeRoute().go(innerContext);
            },
          );
        },
      ),
    );
  }
}
