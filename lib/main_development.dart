import 'package:go_router/go_router.dart';
import 'package:physio/app/app.dart';
import 'package:physio/bootstrap.dart';

import 'app/di/injection.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  // This line tells go_router to update the browser URL with push
  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy(); // Remove hash (#) from URLs on web

  configureDependencies();
  bootstrap(() => const App());
}
