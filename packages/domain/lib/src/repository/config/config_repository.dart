import 'package:utils/utils.dart';

import '../../model/config/config.dart';

abstract class ConfigRepository{
  Future<Result<Config>> getConfig();
}