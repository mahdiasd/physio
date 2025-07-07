import 'dart:math';

import 'package:domain/domain.dart';

class FakeDataProvider {
  FakeDataProvider._();
  static final FakeDataProvider instance = FakeDataProvider._();

  List<PhysioFile> getFakeFiles({int count = 5, bool isImage = false}) {
    return List.generate(count, (index) {
      final isVideo = !isImage;
      return PhysioFile(
        id: 'file-$index',
        originalFilename: isVideo ? 'video_$index.mp4' : 'image_$index.jpg',
        storedFilename: 'stored_$index',
        storagePath: '/storage/files/$index',
        contentType: isVideo ? 'video/mp4' : 'image/jpeg',
        fileCategory: isVideo ? 'video' : 'image',
        status: 'ready',
        isPublic: true,
      );
    });
  }

  List<VideoCategory> getFakeVideoCategories() {
    return [
      VideoCategory(
        id: 'cat-1',
        name: 'Fitness',
        description: 'Workouts and exercises',
        colorCode: '#FF6B6B',
        isActive: true,
      ),
      VideoCategory(
        id: 'cat-2',
        name: 'Nutrition',
        description: 'Healthy eating tips',
        colorCode: '#4ECDC4',
        isActive: true,
      ),
      VideoCategory(
        id: 'cat-3',
        name: 'Mindfulness',
        description: 'Meditation and relaxation',
        colorCode: '#FFD93D',
        isActive: true,
      ),
    ];
  }

  List<Video> getFakeVideos({int count = 5}) {
    final random = Random();
    final videoFile = PhysioFile(
      id: 'file-video',
      originalFilename: 'BigBuckBunny.mp4',
      storedFilename: 'bbb.mp4',
      storagePath: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
      contentType: 'video/mp4',
      fileCategory: 'video',
      status: 'ready',
      isPublic: true,
    );

    final categories = getFakeVideoCategories();

    return List.generate(count, (index) {
      final thumbnail = PhysioFile(
        id: 'thumb-$index',
        originalFilename: 'thumb_$index.jpg',
        storedFilename: 'thumb_$index.jpg',
        storagePath: 'https://picsum.photos/seed/thumb$index/400/300',
        contentType: 'image/jpeg',
        fileCategory: 'image',
        status: 'ready',
        isPublic: true,
      );

      return Video(
        id: 'video-$index',
        title: 'Sample Video $index',
        description: 'This is a description for video $index.',
        file: videoFile,
        thumbnailFile: thumbnail,
        durationSeconds: 120 + index * 10,
        category: categories[random.nextInt(categories.length)],
        visibility: VideoVisibility.public,
        status: VideoStatus.ready,
        viewCount: random.nextInt(1000),
        createdAt: DateTime.now().subtract(Duration(days: index)),
      );
    });
  }
}
