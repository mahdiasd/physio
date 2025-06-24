import 'package:go_router/go_router.dart';
import 'package:physio/app/routing/forgot/forgot_route.dart';
import 'package:physio/app/routing/main/main_route.dart';
import 'package:physio/app/routing/splash/splash_route.dart';
import 'package:physio/app/routing/verify/verify_route.dart';

import 'login/login_route.dart';
import 'register/register_route.dart';

final router = GoRouter(
  initialLocation: SplashRoute().location,
  routes: [$splashRoute, $loginRoute, $registerRoute, $mainRoute, $forgotRoute, $verifyRoute],
  routerNeglect: false,
);
