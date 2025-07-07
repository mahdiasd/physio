// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogPostResponse _$BlogPostResponseFromJson(Map<String, dynamic> json) =>
    BlogPostResponse(
      id: json['id'] as String,
      author: UserResponse.fromJson(json['author'] as Map<String, dynamic>),
      title: json['title'] as String,
      slug: json['slug'] as String,
      excerpt: json['excerpt'] as String,
      content: json['content'] as String,
      featuredImage:
          FileResponse.fromJson(json['featuredImage'] as Map<String, dynamic>),
      status: json['status'] as String,
      publishedAt: json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
      viewCount: (json['viewCount'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$BlogPostResponseToJson(BlogPostResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'title': instance.title,
      'slug': instance.slug,
      'excerpt': instance.excerpt,
      'content': instance.content,
      'featuredImage': instance.featuredImage,
      'status': instance.status,
      'publishedAt': instance.publishedAt?.toIso8601String(),
      'viewCount': instance.viewCount,
      'createdAt': instance.createdAt.toIso8601String(),
    };
