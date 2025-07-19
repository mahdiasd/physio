import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:physio/bootstrap.dart';
import 'package:physio/view/app.dart';

import 'di/injection.dart';

void main() {
  // This line tells go_router to update the browser URL with push
  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy(); // Remove hash (#) from URLs on web

  configureDependencies();
  bootstrap(() => const App());
}
