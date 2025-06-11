import 'package:injectable/injectable.dart';
import 'package:physio/app/di/injection.config.dart';
import 'package:utils/utils.dart';

@InjectableInit(
    initializerName: 'init',
    preferRelativeImports: true,
    asExtension: true,
)
void configureDependencies() => getIt.init();
