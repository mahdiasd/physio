import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forgot/forgot.dart';
import 'package:go_router/go_router.dart';
import 'package:physio/app/routing/reset_password/reset_password_route.dart';
import 'package:physio/app/routing/verify/verify_route.dart';
import 'package:utils/utils.dart';

part 'forgot_route.g.dart';

@TypedGoRoute<ForgotRoute>(path: "/forgot")
@immutable
class ForgotRoute extends GoRouteData {
  const ForgotRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => getIt<ForgotBloc>(),
      child: Builder(
        builder: (innerContext) {
          return ForgotPage(
            navigateBack: () => innerContext.pop(),
            navigateToVerify: () {
              innerContext.push(ResetPasswordRoute().location);
            },
          );
        },
      ),
    );
  }
}
