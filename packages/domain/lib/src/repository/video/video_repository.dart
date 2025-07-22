import 'package:utils/utils.dart';

import '../../../domain.dart';

abstract class VideoRepository {
  Future<Result<Paging<VideoSummary>>> search({
    required int page,
    String? tag = null,
    String? category = null,
    String? search = null,
    bool? isPublic = null,
  });

  Future<Result<Video>> get({
    required String id,
  });

  Future<Result<bool>> flag({
    required String id,
  });
}
