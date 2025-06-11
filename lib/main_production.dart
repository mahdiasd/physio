import 'package:physio/app/app.dart';
import 'package:physio/bootstrap.dart';
import 'package:utils/utils.dart';

void main() {
  configureDependencies();
  bootstrap(() => const App());
}
