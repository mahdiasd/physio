import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forgot/forgot.dart';
import 'package:go_router/go_router.dart';
import 'package:physio/app/routing/register/register_route.dart';
import 'package:utils/utils.dart';

part 'verify_route.g.dart';

@TypedGoRoute<VerifyRoute>(path: "/verify")
@immutable
class VerifyRoute extends GoRouteData {
  const VerifyRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => getIt<VerifyBloc>(),
      child: Builder(
        builder: (innerContext) {
          return VerifyPage(
            navigateBack: () => innerContext.pop(),
            navigateToVerify: () {
              innerContext.push(RegisterRoute().location);
            },
          );
        },
      ),
    );
  }
}
