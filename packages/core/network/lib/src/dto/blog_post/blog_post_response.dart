import 'package:json_annotation/json_annotation.dart';
import '../../../network.dart';


part 'blog_post_response.g.dart';

@JsonSerializable()
class BlogPostResponse {
  BlogPostResponse({
    required this.id,
    required this.author,
    required this.title,
    required this.slug,
    required this.excerpt,
    required this.content,
    required this.featuredImage,
    required this.status,
    required this.publishedAt,
    required this.viewCount,
    required this.createdAt,
  });

  factory BlogPostResponse.fromJson(Map<String, dynamic> json) =>
      _$BlogPostResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BlogPostResponseToJson(this);

  final String id;
  final UserResponse author;
  final String title;
  final String slug;
  final String excerpt;
  final String content;
  final String featuredImage;
  final String status;
  final DateTime? publishedAt;
  final int viewCount;
  final DateTime createdAt;
}
