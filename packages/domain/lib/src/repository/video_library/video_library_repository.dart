import 'package:utils/utils.dart';

import '../../../domain.dart';

abstract class VideoLibraryRepository {
  Future<Result<VideoLibrary>> get();
}
