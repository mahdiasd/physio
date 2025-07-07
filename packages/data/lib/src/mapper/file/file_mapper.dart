import 'package:network/network.dart';
import 'package:domain/domain.dart';

extension FileResponseMapper on FileResponse {
  PhysioFile toDomain() => PhysioFile(
    id: id,
    originalFilename: originalFilename,
    storedFilename: storedFilename,
    storagePath: storagePath,
    contentType: contentType,
    fileCategory: fileCategory,
    status: status,
    isPublic: isPublic,
  );
}
