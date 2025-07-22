import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/utils.dart';

@injectable
class FlagVideoUseCase {
  final VideoRepository _repo;

  FlagVideoUseCase(this._repo);

  Future<Result<bool>> invoke({
    required String id,
  }) {
    return _repo.flag(id: id);
  }
}
