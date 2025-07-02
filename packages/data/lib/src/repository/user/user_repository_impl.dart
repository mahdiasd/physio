import 'package:data/src/mapper/user/register_mapper.dart';
import 'package:data/src/mapper/user/user_role_mapper.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:network/network.dart';
import 'package:utils/utils.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  final UserApiService _userApiService;

  UserRepositoryImpl(this._userApiService);

  @override
  Future<Result<User>> login({
    required String email,
    required String password,
  }) async {
    final result = await ApiCaller.safeApiCall<LoginResponse>(
      () => _userApiService.login(email: email, password: password),
    );

    switch (result) {
      case Ok<LoginResponse>():
        return Result.ok(_mapToUser(result.value));
      case Error<LoginResponse>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<User>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final result = await ApiCaller.safeApiCall<RegisterResponse>(
      () => _userApiService.register(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      ),
    );

    switch (result) {
      case Ok<RegisterResponse>():
        return Result.ok(result.value.toDomain());
      case Error<RegisterResponse>():
        PrintHelper.error(result.error.message, location: "UserRepo");
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<String>> validateEmail({
    required String email,
  }) async {
    final result = await ApiCaller.safeApiCall<String>(
      () => _userApiService.validateEmail(
        email: email,
      ),
    );

    switch (result) {
      case Ok<String>():
        return Result.ok(result.value);
      case Error<String>():
        return Result.error(result.error);
    }
  }

  User _mapToUser(LoginResponse loginResponse) {
    return User(
      id: loginResponse.user.id,
      email: loginResponse.user.email,
      firstName: loginResponse.user.firstName,
      lastName: loginResponse.user.lastName,
      username: loginResponse.user.username,
      role: loginResponse.user.role.toUserRole(),
      status: loginResponse.user.status,
    );
  }

  @override
  Future<Result<String>> verifyEmail({required String code, required String email}) async {
    final result = await ApiCaller.safeApiCall<String>(
          () => _userApiService.verifyEmail(
        code: code,
        email: email,
      ),
    );

    switch (result) {
      case Ok<String>():
        return Result.ok(result.value);
      case Error<String>():
        return Result.error(result.error);
    }
  }
}
