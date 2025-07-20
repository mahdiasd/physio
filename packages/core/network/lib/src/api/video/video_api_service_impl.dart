import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:network/network.dart';
import 'package:utils/utils.dart';

@LazySingleton(as: VideoApiService)
class VideoApiServiceImpl extends VideoApiService {
  final Dio dio;

  @override
  VideoApiServiceImpl(this.dio);

  @override
  Future<Response<NetworkResponse<List<VideoSummaryResponse>>>> getVideos() {
    return ApiWrapper.getRequest<List<VideoSummaryResponse>>(
      dio,
      'v1/videos',
      fromJsonT: (json) {
        PrintHelper.info(json.toString(), location: "VideoApiServiceImpl");
        return (json as List<dynamic>)
            .map((e) => VideoSummaryResponse.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
  }
}
