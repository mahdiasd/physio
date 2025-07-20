import 'package:dio/dio.dart';
import 'package:network/network.dart';
import 'package:network/src/dto/library/video_library_response.dart';
import 'package:network/src/dto/response/network_response.dart';

abstract class VideoApiService {
  Future<Response<NetworkResponse<List<VideoSummaryResponse>>>> getVideos();
  Future<Response<NetworkResponse<List<VideoResponse>>>> getVideos();
}
