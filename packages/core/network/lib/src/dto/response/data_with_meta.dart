import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../network.dart';

part 'data_with_meta.freezed.dart';

@freezed
abstract class DataWithMeta<T> with _$DataWithMeta<T> {
  const factory DataWithMeta({required T data, PagingMetaResponse? meta}) = _DataWithMeta<T>;
}
