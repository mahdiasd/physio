import 'package:dio/dio.dart';
import 'package:network/network.dart';

abstract class VideoApiService {
  Future<Response<NetworkResponse<List<VideoSummaryResponse>>>> search({
    required int page,
    String? tag = null,
    String? category = null,
    String? search = null,
    bool? isPublic = null,
  });

  Future<Response<NetworkResponse<VideoResponse>>> getSingle({required String id});

  Future<Response<NetworkResponse<EmptyResponse>>> flag({required String id});
}
