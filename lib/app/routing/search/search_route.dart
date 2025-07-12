import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:search/search.dart';
import 'package:ui/ui.dart';
import 'package:utils/utils.dart';

part 'search_route.g.dart';

@TypedGoRoute<SearchRoute>(
  path: "/search",
)
@immutable
class SearchRoute extends GoRouteData {
  final String? videoCategoryId;
  final bool? recentVideos;
  final bool? popularVideos;
  final bool? shouldersVideos;

  const SearchRoute({
    this.videoCategoryId,
    this.recentVideos,
    this.popularVideos,
    this.shouldersVideos,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final bloc = getIt<SearchBloc>();

    return BlocProvider(
      create: (context) {
        bloc.passData(SearchParams(
          videoCategoryId: this.videoCategoryId,
          isRecentVideos: this.recentVideos,
          isMostPopularVideo: this.popularVideos,
          isShouldersVideo: this.shouldersVideos,
        ));
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

extension SearchRouteExtension on SearchRoute {
  static SearchRoute fromSearchParams(SearchParams params) {
    return SearchRoute(
      videoCategoryId: params.videoCategoryId,
      recentVideos: params.isRecentVideos,
      popularVideos: params.isMostPopularVideo,
      shouldersVideos: params.isShouldersVideo,
    );
  }
}
