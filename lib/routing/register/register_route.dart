import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:physio/routing/login/login_route.dart';
import 'package:physio/routing/verify/verify_route.dart';
import 'package:register/register.dart';
import 'package:utils/utils.dart';

part 'register_route.g.dart';

@TypedGoRoute<RegisterRoute>(path: "/register")
@immutable
class RegisterRoute extends GoRouteData {
  const RegisterRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final bloc = getIt<RegisterBloc>();
    return BlocProvider(
      create: (context) => bloc,
      child: Builder(
        builder: (innerContext) {
          return RegisterPage(
            navigateToVerify: () {
              innerContext.push(VerifyRoute(bloc.state.email).location);
            },
            navigateBack: () => LoginRoute().pushReplacement(innerContext),
          );
        },
      ),
    );
  }
}
