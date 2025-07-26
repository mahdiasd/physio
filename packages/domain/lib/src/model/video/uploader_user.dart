import 'package:freezed_annotation/freezed_annotation.dart';

part 'uploader_user.freezed.dart';

@freezed
abstract class UploaderUser with _$UploaderUser {
  const factory UploaderUser({
    required String firstName,
    required String lastName,
  }) = _UploaderUser;
}