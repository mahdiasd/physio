import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/utils.dart';

@injectable
class GetVideosUseCase {
  final VideoRepository _repo;

  GetVideosUseCase(this._repo);

  Future<Result<Paging<VideoSummary>>> invoke({
    required int page,
    String? tag,
    String? category,
    String? search,
    bool? isPublic,
  }) {
    return _repo.search(
      page: page,
      tag: tag,
      category: category,
      search: search,
      isPublic: isPublic,
    );
  }
}
