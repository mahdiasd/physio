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
  Future<Response<NetworkResponse<VideoResponse>>> getSingle({
    required String id,
  }) {
    return ApiWrapper.postRequest<VideoResponse>(
      dio,
      'v1/videos/$id',
      fromJsonT: (json) => VideoResponse.fromJson(json as Map<String, dynamic>),
    );
  }

  @override
  Future<Response<NetworkResponse<List<VideoSummaryResponse>>>> search({
    required int page,
    String? tag = null,
    String? category = null,
    String? search = null,
    bool? isPublic = null,
  }) {
    return ApiWrapper.getRequest<List<VideoSummaryResponse>>(
      dio,
      'v1/videos',
      fromJsonT: (json) {
        PrintHelper.info(json.toString(), location: "VideoApiServiceImpl");
        return (json as List<dynamic>).map((e) => VideoSummaryResponse.fromJson(e as Map<String, dynamic>)).toList();
      },
    );
  }

  @override
  Future<Response<NetworkResponse<EmptyResponse>>> flag({required String id}) {
    return ApiWrapper.postRequest<EmptyResponse>(
      dio,
      '/v1/videos/${id}/flag',
      fromJsonT: (json) => EmptyResponse.fromJson(json as Map<String, dynamic>),
    );
  }
}
