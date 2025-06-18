import 'package:injectable/injectable.dart';

// @microPackageInit => short const
@InjectableInit.microPackage()
void initNetworkMicroPackage(){} // will not be called but needed for code generation