import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:network/network.dart';
import 'package:utils/utils.dart';

import '../../mapper/mapper.dart';

@LazySingleton(as: VideoRepository)
class VideoRepositoryImpl extends VideoRepository {
  final VideoApiService _apiService;
  final Mappr _mappr;

  VideoRepositoryImpl(this._apiService, this._mappr);

  Future<Result<Paging<VideoSummary>>> search(
      {required int page, String? tag = null, String? category = null, String? search = null, bool? isPublic = null}) async {
    final result = await ApiCaller.safeApiCallWithMeta<List<VideoSummaryResponse>>(
      () => _apiService.search(
        page: page,
        tag: tag,
        category: category,
        search: search,
        isPublic: isPublic,
      ),
    );

    switch (result) {
      case Ok<DataWithMeta<List<VideoSummaryResponse>>>():
        final content = _mappr.convert<List<VideoSummaryResponse>, List<VideoSummary>>(result.value.data);
        return Result.ok(Paging(content: content));
      case Error<DataWithMeta<List<VideoSummaryResponse>>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<Video>> get({required String id}) async {
    final result = await ApiCaller.safeApiCall<VideoResponse>(() => _apiService.getSingle(id: id));

    switch (result) {
      case Ok<VideoResponse>():
        final content = _mappr.convert<VideoResponse, Video>(result.value);
        return Result.ok(content);
      case Error<VideoResponse>():
        return Result.error(result.error);
    }
  }
}
