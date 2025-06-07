import 'package:json_annotation/json_annotation.dart';
import 'package:network/src/dto/response/paging_meta_response.dart';

part 'network_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class NetworkResponse<T> {
  NetworkResponse({
    required this.status,
    required this.data,
    this.message,
    this.meta,
  });

  factory NetworkResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$NetworkResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(
    Object? Function(T value) toJsonT,
  ) =>
      _$NetworkResponseToJson(this, toJsonT);

  final String status;
  final T? data;
  String? message = '';
  PagingMetaResponse? meta;
}
