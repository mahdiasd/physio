import 'package:dio/dio.dart';
import 'package:network/src/dto/library/video_library_response.dart';
import 'package:network/src/dto/response/network_response.dart';

abstract class VideoLibraryApiService {
  Future<Response<NetworkResponse<List<VideoLibraryResponse>>>> getVideoLibrary();
}
