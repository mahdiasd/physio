import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:physio/routing/main/main_route.dart';
import 'package:ui/ui.dart';
import 'package:utils/utils.dart';
import 'package:video_detail/video_detail.dart';

part 'video_detail_route.g.dart';


@TypedGoRoute<VideoDetailRoute>(
  path: "/video_detail",
)
@immutable
class VideoDetailRoute extends GoRouteData {
  final String? videoId;

  const VideoDetailRoute(this.videoId);

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final bloc = getIt<VideoDetailBloc>();
    return BlocProvider(
      create: (context) {
        bloc.passData(videoId ?? "");
        return bloc;
      },
      child: Builder(
        builder: (innerContext) {
          return VideoDetailPage(
            navigateBack: () => innerContext.pop(),
            navigateToVideoDetail: (String value) {
              innerContext.pushReplacement(VideoDetailRoute(value).location);
            },
            onSidebarClick: (NavigationItem value) => value.goTo(innerContext),
          );
        },
      ),
    );
  }
}
