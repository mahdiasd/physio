import 'package:json_annotation/json_annotation.dart';
import 'package:network/src/dto/config/update_response.dart';

part 'config_response.g.dart';

@JsonSerializable()
class ConfigResponse {
  final UpdateResponse update;
  ConfigResponse(this.update);

  factory ConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfigResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigResponseToJson(this);

}
