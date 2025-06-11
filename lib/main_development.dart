import 'package:physio/app/app.dart';
import 'package:physio/bootstrap.dart';
import 'package:splash/splash.dart';
import 'package:utils/utils.dart';

void main() {
  configureDependencies();
  configureSplashDependencies();
  bootstrap(() => const App());
}
