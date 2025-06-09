import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:network/network.dart';
import 'package:utils/utils.dart';

@LazySingleton()
class UserRepositoryImpl extends UserRepository {
  final UserApiService _userApiService;

  UserRepositoryImpl(this._userApiService);

  @override
  Future<Result<User>> login(String username, String password) async {
    final result = await ApiCaller.safeApiCall<LoginResponse>(
      () => _userApiService.login(username, password),
    );

    switch (result) {
      case Ok<LoginResponse>():
        return Result.ok(_mapToUser(result.value));
      case Error<LoginResponse>():
        return Result.error(result.error);
    }
  }

  User _mapToUser(LoginResponse loginResponse) {
    return User(
      id: loginResponse.user.id,
      firstName: loginResponse.user.firstName,
      lastName: loginResponse.user.lastName,
      username: loginResponse.user.username,
      avatar: loginResponse.user.avatar,
      mySessionCount: loginResponse.user.mySessionCount,
      totalSessions: loginResponse.user.totalSessions,
      post: loginResponse.user.post,
    );
  }
}
