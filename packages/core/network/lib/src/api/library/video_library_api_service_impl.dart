import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:network/src/api/library/video_library_api_service.dart';
import 'package:network/src/dto/library/video_library_response.dart';
import 'package:network/src/utils/api_wrapper.dart';

import '../../dto/response/network_response.dart';

@LazySingleton(as: VideoLibraryApiService)
class VideoLibraryApiServiceImpl extends VideoLibraryApiService {
  final Dio dio;

  @override
  VideoLibraryApiServiceImpl(this.dio);



  @override
  Future<Response<NetworkResponse<List<VideoLibraryResponse>>>> getVideoLibrary() {
    return ApiWrapper.getRequest<List<VideoLibraryResponse>>(
      dio,
      'v1/library',
      fromJsonT: (json) =>
          (json as List<dynamic>).map((e) => VideoLibraryResponse.fromJson(e as Map<String, dynamic>)).toList(),
    );
  }
}
