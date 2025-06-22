import 'package:injectable/injectable.dart';

// @microPackageInit => short const
@InjectableInit.microPackage()
void initDomainMicroPackage(){} // will not be called but needed for code generation