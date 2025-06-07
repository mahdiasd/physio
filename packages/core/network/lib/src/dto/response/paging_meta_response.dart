import 'package:json_annotation/json_annotation.dart';

part 'paging_meta_response.g.dart';

@JsonSerializable()
class PagingMetaResponse {
  PagingMetaResponse({
    required this.totalPages,
    required this.totalItems,
    required this.limit,
    required this.page,
  });

  factory PagingMetaResponse.fromJson(Map<String, dynamic> json) =>
      _$PagingMetaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PagingMetaResponseToJson(this);

  final int totalPages;
  final int totalItems;
  final int limit;
  final int page;
}
