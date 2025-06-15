import 'package:physio/app/app.dart';
import 'package:physio/bootstrap.dart';

import 'app/di/injection.dart';

void main() {
  configureDependencies();
  bootstrap(() => const App());
}
