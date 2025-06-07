import 'package:go_router/go_router.dart';
import 'package:physio/app/routing/main/main_route.dart';

import 'login/login_route.dart';
import 'register/register_route.dart';


final router = GoRouter(
  initialLocation: LoginRoute().location,
  routes: [$loginRoute, $registerRoute, $mainRoute],
);
