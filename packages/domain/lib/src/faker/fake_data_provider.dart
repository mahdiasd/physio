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

  User getFakeAuthor(int index) {
    return User(
      id: 'user-$index',
      email: 'author$index@example.com',
      firstName: 'Author',
      lastName: '$index',
      role: UserRole.ADMIN,
      status: 'active',
    );
  }

  PhysioFile getFakeFeaturedImage(int index) {
    return PhysioFile(
      id: 'blog-image-$index',
      originalFilename: 'featured_$index.jpg',
      storedFilename: 'featured_$index.jpg',
      storagePath: 'https://picsum.photos/seed/blog$index/600/400',
      contentType: 'image/jpeg',
      fileCategory: 'image',
      status: 'ready',
      isPublic: true,
    );
  }

  List<BlogPost> getFakeBlogPosts({int count = 5}) {
    final random = Random();

    return List.generate(count, (index) {
      final author = getFakeAuthor(index);
      final statusList = BlogPostStatus.values;

      return BlogPost(
        id: 'blog-$index',
        author: author,
        title: 'Blog Post Title $index',
        slug: 'blog-post-title-$index',
        excerpt: 'This is a short excerpt for blog post $index.',
        content: '''
          <p>This is a detailed content for <strong>blog post $index</strong>.</p>
          <p>It includes multiple paragraphs and maybe some formatting.</p>
        ''',
        featuredImage: getFakeFeaturedImage(index).storagePath,
        status: statusList[random.nextInt(statusList.length)],
        publishedAt: DateTime.now().subtract(Duration(days: 10 - index)),
        viewCount: random.nextInt(1000),
        createdAt: DateTime.now().subtract(Duration(days: 15 - index)),
      );
    });
  }

  List<VideoCategory> getFakeVideoCategories() {
    final categories = <VideoCategory>[];
    final baseCategories = [
      {'name': 'Fitness', 'description': 'Workouts and exercises', 'color': '#FF6B6B'},
      {'name': 'Nutrition', 'description': 'Healthy eating tips', 'color': '#4ECDC4'},
      {'name': 'Mindfulness', 'description': 'Meditation and relaxation', 'color': '#FFD93D'},
    ];
    final random = Random();

    for (int i = 0; i < 20; i++) {
      final baseCategory = baseCategories[random.nextInt(baseCategories.length)];
      categories.add(
        VideoCategory(
          id: 'cat-$i',
          name: '${baseCategory['name']} $i',
          description: '${baseCategory['description']} $i',
          colorCode: baseCategory['color']!,
          isActive: true,
        ),
      );
    }
    return categories;
  }

  List<Video> getFakeVideos({int count = 5}) {
    final random = Random();

    final categories = getFakeVideoCategories();

    return List.generate(count, (index) {

      return Video(
        id: 'video-$index',
        title: 'Sample Video $index',
        description: 'This is a description for video $index.',
        url: "https://persian18.asset.aparat.com/aparat-video/8dd62307c56c0666dfb0039f4087e6e864484193-720p.mp4?wmsAuthSign=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjJkYWJiZjJmNWY4ZjI4MTc3NjE4ZGY1MjdkYzk3NmY3IiwiZXhwIjoxNzUyNDExMTI1LCJpc3MiOiJTYWJhIElkZWEgR1NJRyJ9.JQIaSi4qRszgZ5V-fNpX2NaRVxBP1fb-tBsG2v_3Zys",
        thumbnail: getFakeFeaturedImage(index).storagePath,
        durationSeconds: 120 + index * 10,
        category: categories[random.nextInt(categories.length)],
        visibility: VideoVisibility.public,
        status: VideoStatus.ready,
        viewCount: random.nextInt(1000),
        createdAt: DateTime.now().subtract(Duration(days: index)),
      );
    });
  }

  VideoLibrary getFakeLibrary() {
    return VideoLibrary(
        categories: getFakeVideoCategories(),
        mainVideo: getFakeVideos().first,
        recentVideos: getFakeVideos(count: 5),
        mostVideos: getFakeVideos(count: 6),
        shouldersVideos: getFakeVideos(count: 10),
        blogPosts: getFakeBlogPosts(count: 8));
  }
}
