import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forgot/forgot.dart';
import 'package:go_router/go_router.dart';
import 'package:utils/utils.dart';

import '../reset_password/reset_password_route.dart';

part 'forgot_route.g.dart';

@TypedGoRoute<ForgotRoute>(path: "/forgot")
@immutable
class ForgotRoute extends GoRouteData {
  const ForgotRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final bloc = getIt<ForgotBloc>();
    return BlocProvider(
      create: (context) => bloc,
      child: Builder(
        builder: (innerContext) {
          return ForgotPage(
            navigateBack: () => innerContext.pop(),
            navigateToResetPassword: () {
              innerContext.push(ResetPasswordRoute(bloc.state.email).location);
            },
          );
        },
      ),
    );
  }
}
