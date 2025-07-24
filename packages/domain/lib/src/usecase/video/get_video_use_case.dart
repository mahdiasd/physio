import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/utils.dart';

@injectable
class GetVideoUseCase {
  final VideoRepository _repo;

  GetVideoUseCase(this._repo);

  Future<Result<Video>> invoke({
    required String id,
  }) {
    return _repo.get(id: id);
  }
}
