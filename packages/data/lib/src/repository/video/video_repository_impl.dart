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

  Future<Result<Paging<VideoSummary>>> search({required int page, String? tag = null, String? category = null, String? search = null, bool? isPublic = null}) async {
    final result = await ApiCaller.safeApiCall<List<VideoSummaryResponse>>(
          () => _apiService.getVideos(),
    );

    switch (result) {
      case Ok<List<VideoSummaryResponse>>():
        return Result.ok(Paging(content: _mappr.convert<List<VideoSummaryResponse>, List<VideoSummary>>(result.value)));
      case Error<List<VideoSummaryResponse>>():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<Map<Video, List<Video>>>> get({required String id}) async {
    final result = await ApiCaller.safeApiCall<List<VideoSummaryResponse>>(
          () => _apiService.getVideos(),
    );

    switch (result) {
      case Ok<List<VideoSummaryResponse>>():
        return Result.ok(Paging(content: _mappr.convert<List<VideoSummaryResponse>, List<VideoSummary>>(result.value)));
      case Error<List<VideoSummaryResponse>>():
        return Result.error(result.error);
    }
  }
}
