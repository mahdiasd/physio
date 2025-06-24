import 'package:domain/src/model/user.dart';
import 'package:utils/utils.dart';

abstract class UserRepository {
  Future<Result<User>> login({required String email, required String password});

  Future<Result<User>> register(
      {required String firstName,
      required String lastName,
      required String email,
      required String password});

  Future<Result<String>> validateEmail({required String email});

  Future<Result<String>> sendOtpCodes({required String code});
}
