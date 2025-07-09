import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:search/search.dart';
import 'package:ui/ui.dart';
import 'package:utils/utils.dart';

@TypedGoRoute<SearchRoute>(
  path: "/search",
)
@immutable
class SearchRoute extends GoRouteData {
  final String? searchParamsJson;

  const SearchRoute(this.searchParamsJson);

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final bloc = getIt<SearchBloc>();
    return BlocProvider(
      create: (context)  {
        bloc.passData(searchParamsJson != null ? SearchParam.fromJson(searchParamsJson! as Map<String, dynamic>) : SearchParam());
        return bloc;
      },
      child: Builder(
        builder: (innerContext) {
          return SearchPage(
            navigateBack: () => innerContext.pop(),
          );
        },
      ),
    );
  }
}
