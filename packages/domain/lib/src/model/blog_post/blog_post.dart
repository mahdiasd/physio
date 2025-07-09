import '../../../domain.dart';

class BlogPost {
  BlogPost({
    required this.id,
    required this.author,
    required this.title,
    required this.slug,
    required this.excerpt,
    required this.content,
    required this.featuredImage,
    required this.status,
    this.publishedAt,
    required this.viewCount,
    required this.createdAt,
  });

  final String id;
  final User author;
  final String title;
  final String slug;
  final String excerpt;
  final String content;
  final String featuredImage;
  final BlogPostStatus status;
  final DateTime? publishedAt;
  final int viewCount;
  final DateTime createdAt;
}
