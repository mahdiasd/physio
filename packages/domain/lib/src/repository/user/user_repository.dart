import 'package:domain/src/model/user/user.dart';
import 'package:utils/utils.dart';

abstract class UserRepository {
  Future<Result<Map<String, dynamic>>> login({required String email, required String password});

  Future<Result<User>> register(
      {required String firstName,
      required String lastName,
      required String email,
      required String password});

  Future<Result<String>> validateEmail({required String email});

  Future<Result<bool>> verifyEmail({
    required String code,
    required String email,
  });

  Future<Result<bool>> resetPassword({
    required String email,
    required String code,
    required String password,
    required String confirmPassword,
  });

  Future<Result<bool>> resendOTP({
    required String email,
    required String type,
  });
}
