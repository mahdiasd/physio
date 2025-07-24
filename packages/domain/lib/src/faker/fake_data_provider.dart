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
        fileSize: '',
        s3Url: "https://persian11.cdn.asset.aparat.com/aparat-video/a2a6d25602af467af2061a78843dbc0160237955-240p.mp4?wmsAuthSign=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjAwNDIzNGViNGQzMGM2Zjg3ZDQyN2VhYzUzOTI3YWNlIiwiZXhwIjoxNzUzMzUxMDQ2LCJpc3MiOiJTYWJhIElkZWEgR1NJRyJ9.dMljqOQTCWuUgmo-pONY9OwzIl7W1Y2YHPUdFhXaU0k",
        storageType: '',
        uploadedBy: '',
        url: 'https://placehold.co/600x400.png',
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
      storagePath: 'https://placehold.co/600x400.png',
      contentType: 'image/jpeg',
      fileCategory: 'image',
      fileSize: '',
      s3Url: "https://persian11.cdn.asset.aparat.com/aparat-video/a2a6d25602af467af2061a78843dbc0160237955-240p.mp4?wmsAuthSign=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IjAwNDIzNGViNGQzMGM2Zjg3ZDQyN2VhYzUzOTI3YWNlIiwiZXhwIjoxNzUzMzUxMDQ2LCJpc3MiOiJTYWJhIElkZWEgR1NJRyJ9.dMljqOQTCWuUgmo-pONY9OwzIl7W1Y2YHPUdFhXaU0k",
      storageType: '',
      uploadedBy: '',
      url: 'https://placehold.co/600x400.png',
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

  List<String> getFakeVideoCategories() {
    final baseCategories = [
      "Fitness",
      "Nutrition",
      "Mindfulness",
    ];
    return baseCategories;
  }

  List<VideoSummary> getFakeVideoSummeries({int count = 5}) {
    final random = Random();

    final categories = getFakeVideoCategories();

    return List.generate(count, (index) {
      return VideoSummary(
        id: 'video-$index',
        title: 'Sample Video $index',
        description: 'This is a description for video $index.',
        coverPhoto:
            "https://placehold.co/600x400.png",
        viewCount: random.nextInt(1000),
        uploader: UploaderUser(firstName: "firstName", lastName: "lastName"),
        category: categories[random.nextInt(categories.length)],
      );
    });
  }

  List<Video> getFakeVideos(int count) {
    return List.generate(count, (index) {
      return Video(
        category: "faker.lorem.word()",
        coverPhoto: "https://placehold.co/600x400.png",
        createdAt: DateTime.now(),
        description: "faker.lorem.sentence()",
        id: "faker.guid.guid()",
        isPublic: false,
        relatedVideos: getFakeVideoSummeries(count: 4),
        status: "",
        tags: ["tag 1" , "tag 2"],
        title: "Video title",
        updatedAt: DateTime.now(),
        uploader: UploaderUser(
         firstName: 'firstName', lastName: 'lastName',
        ),
        videoFile: getFakeFiles(count: 1, isImage: false).first,
      );
    });
  }

  VideoLibrary getFakeLibrary() {
    return VideoLibrary(
        categories: getFakeVideoCategories(),
        mainVideo: getFakeVideoSummeries().first,
        recentVideos: getFakeVideoSummeries(count: 5),
        mostVideos: getFakeVideoSummeries(count: 6),
        shouldersVideos: getFakeVideoSummeries(count: 10),
        blogPosts: getFakeBlogPosts(count: 8));
  }
}
