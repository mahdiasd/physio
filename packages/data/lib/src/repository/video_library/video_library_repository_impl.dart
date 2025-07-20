import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:network/network.dart';
import 'package:utils/utils.dart';

import '../../mapper/mapper.dart';

@LazySingleton(as: VideoLibraryRepository)
class VideoLibraryRepositoryImpl extends VideoLibraryRepository {
  final VideoLibraryApiService _apiService;
  final Mappr _mappr;

  VideoLibraryRepositoryImpl(this._apiService, this._mappr);

  @override
  Future<Result<VideoLibrary>> get() async {
    final result = await ApiCaller.safeApiCall<VideoLibraryResponse>(
      () => _apiService.getVideoLibrary(),
    );

    switch (result) {
      case Ok<VideoLibraryResponse>():
        return Result.ok(_mappr.convert<VideoLibraryResponse, VideoLibrary>(result.value));
      case Error<VideoLibraryResponse>():
        return Result.error(result.error);
    }
  }
}
