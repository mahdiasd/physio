import 'package:data/src/mapper/library/video_library_mapper.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:network/network.dart';
import 'package:utils/utils.dart';

@LazySingleton(as: VideoLibraryRepository)
class VideoLibraryRepositoryImpl extends VideoLibraryRepository {
  final VideoLibraryApiService _apiService;

  VideoLibraryRepositoryImpl(this._apiService);

  @override
  Future<Result<VideoLibrary>> get() async {
    final result = await ApiCaller.safeApiCall<VideoLibraryResponse>(
          () => _apiService.getVideoLibrary(),
    );

    switch (result) {
      case Ok<VideoLibraryResponse>():
        return Result.ok(result.value.toDomain());
      case Error<VideoLibraryResponse>():
        return Result.error(result.error);
    }
  }
}
