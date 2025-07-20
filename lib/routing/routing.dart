import 'package:go_router/go_router.dart';
import 'package:physio/routing/forgot/forgot_route.dart';
import 'package:physio/routing/main/main_route.dart';
import 'package:physio/routing/reset_password/reset_password_route.dart';
import 'package:physio/routing/search/search_route.dart';
import 'package:physio/routing/splash/splash_route.dart';
import 'package:physio/routing/verify/verify_route.dart';
import 'package:physio/routing/video_detail/video_detail_route.dart';

import 'login/login_route.dart';
import 'register/register_route.dart';

final router = GoRouter(
  initialLocation: SplashRoute().location,
  routes: [
    $splashRoute,
    $loginRoute,
    $registerRoute,
    $mainRoute,
    $forgotRoute,
    $verifyRoute,
    $resetPasswordRoute,
    $searchRoute,
    $videoDetailRoute,
  ],
  routerNeglect: false,
);
