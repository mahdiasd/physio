/// Package that manage http requests
library;

export 'src/api/user/user_api_service.dart';
export 'src/api/config/config_api_service.dart';

export 'src/dto/user/login_response.dart';
export 'src/dto/user/user_response.dart';
export 'src/dto/user/register_response.dart';
export 'src/dto/config/config_response.dart';
export 'src/dto/config/update_response.dart';

export 'src/network.dart';

export 'src/utils/api_caller.dart';

export 'src/di/network_module.dart';
export 'src/di/network_di.dart';
