import 'package:domain/domain.dart';
import 'package:domain/src/faker/fake_data_provider.dart';
import 'package:utils/utils.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLibraryUseCase {
  final VideoLibraryRepository _repo;

  GetLibraryUseCase(this._repo);

  Future<Result<VideoLibrary>> invoke() async {
    return Result.ok(FakeDataProvider.instance.getFakeLibrary());
    // return _repo.get();
  }
}
