import 'package:data/src/mapper/user/register_mapper.dart';
import 'package:data/src/mapper/user/user_role_mapper.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:network/network.dart';
import 'package:storage/storage.dart';
import 'package:utils/utils.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  final UserApiService _userApiService;
  final StorageService _storageService;

  UserRepositoryImpl(this._userApiService, this._storageService);

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
        await _storageService.write(key: StorageKeys.accessToken, value: result.value.accessToken);
        await _storageService.write(key: StorageKeys.refreshToken, value: result.value.refreshToken);
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

  @override
  Future<Result<bool>> verifyEmail({required String code, required String email}) async {
    final result = await ApiCaller.safeApiCall<VerifyEmailResponse>(
      () => _userApiService.verifyEmail(
        code: code,
        email: email,
      ),
    );

    switch (result) {
      case Ok<VerifyEmailResponse>():
        await _storageService.write(key: StorageKeys.accessToken, value: result.value.accessToken);
        await _storageService.write(key: StorageKeys.refreshToken, value: result.value.refreshToken);
        return Result.ok(true);
      case Error<VerifyEmailResponse>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<bool>> resendOTP({required String email, required String type}) async {
    final result = await ApiCaller.safeApiCall<EmptyResponse>(
      () => _userApiService.resendOTP(
        email: email,
        type: type,
      ),
    );

    switch (result) {
      case Ok<EmptyResponse>():
        return Result.ok(true);
      case Error<EmptyResponse>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<bool>> resetPassword({required String email, required String code, required String password, required String confirmPassword}) async {
    final result = await ApiCaller.safeApiCall<ResetPasswordResponse>(
      () => _userApiService.resetPassword(
        email: email,
        code: code,
        password: password,
        confirmPassword: confirmPassword,
      ),
    );

    switch (result) {
      case Ok<ResetPasswordResponse>():
        await _storageService.write(key: StorageKeys.accessToken, value: result.value.accessToken);
        await _storageService.write(key: StorageKeys.refreshToken, value: result.value.refreshToken);
        return Result.ok(true);
      case Error<ResetPasswordResponse>():
        return Result.error(result.error);
    }
  }

  User _mapToUser(LoginResponse loginResponse) {
    return User(
      id: loginResponse.user.id,
      email: loginResponse.user.email,
      firstName: loginResponse.user.firstName,
      lastName: loginResponse.user.lastName,
      role: loginResponse.user.role.toUserRole(),
      status: loginResponse.user.status,
    );
  }
}
