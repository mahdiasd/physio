import 'package:injectable/injectable.dart';

import '../mapper/mapper.dart';

@module
abstract class AppModule {
  @lazySingleton
  Mappr get mappr => Mappr();
}
