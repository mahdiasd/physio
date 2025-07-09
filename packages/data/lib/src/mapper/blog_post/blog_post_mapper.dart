import 'package:data/src/mapper/user/user_mapper.dart';
import 'package:domain/domain.dart';
import 'package:network/network.dart';

extension BlogPostResponseMapper on BlogPostResponse {
  BlogPost toDomain() => BlogPost(
    id: id,
    author: author.toDomain(),
    title: title,
    slug: slug,
    excerpt: excerpt,
    content: content,
    featuredImage: featuredImage,
    status: status.toBlogPostStatus(),
    publishedAt: publishedAt,
    viewCount: viewCount,
    createdAt: createdAt,
  );
}

extension BlogPostStatusX on String {
  BlogPostStatus toBlogPostStatus() {
    switch (this) {
      case 'draft':
        return BlogPostStatus.draft;
      case 'published':
        return BlogPostStatus.published;
      case 'archived':
        return BlogPostStatus.archived;
      default:
        throw Exception('Unknown blog post status: $this');
    }
  }
}

extension BlogPostStatusToString on BlogPostStatus {
  String toJson() => toString().split('.').last;
}