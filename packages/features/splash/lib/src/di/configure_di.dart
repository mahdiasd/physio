import 'package:utils/utils.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(initializerName: 'splash')
void configureSplashDependencies() => getIt.init();
