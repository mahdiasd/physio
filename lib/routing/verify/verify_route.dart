import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:physio/routing/main/main_route.dart';
import 'package:utils/utils.dart';
import 'package:verify/verify.dart';

part 'verify_route.g.dart';

@TypedGoRoute<VerifyRoute>(
  path: "/verify",
)
@immutable
class VerifyRoute extends GoRouteData {
  final String? email;

  const VerifyRoute(this.email);

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final bloc = getIt<VerifyBloc>();
    return BlocProvider(
      create: (context)  {
        bloc.passData(email ?? "");
        return bloc;
      },
      child: Builder(
        builder: (innerContext) {
          return VerifyPage(
            navigateBack: () => innerContext.pop(),
            navigateToMain: () {
              innerContext.push(HomeRoute().location);
            },
          );
        },
      ),
    );
  }
}
