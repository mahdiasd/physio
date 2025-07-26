import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:domain/domain.dart';
import 'package:network/network.dart';

import 'mapper.auto_mappr.dart';

@AutoMappr([
  MapType<UserResponse, User>(
    fields: [
      Field('role', custom: Mappr.convertUserRole),
    ],
  ),
  MapType<RegisterResponse, User>(
    fields: [
      Field('id', custom: Mappr.convertNullableString),
      Field('email', custom: Mappr.convertNullableString),
      Field('firstName', custom: Mappr.convertNullableString),
      Field('lastName', custom: Mappr.convertNullableString),
      Field('role', custom: Mappr.convertUserRole),
    ],
  ),

  MapType<BlogPostResponse, BlogPost>(
    fields: [
      Field('status', custom: Mappr.convertPostStatus),
    ],
  ),

  MapType<UploaderUserResponse, UploaderUser>(),

  MapType<FileResponse, PhysioFile>(),

  MapType<ConfigResponse, Config>(),

  MapType<UpdateResponse, Update>(),

  MapType<VideoSummaryResponse, VideoSummary>(),
  MapType<VideoLibraryResponse, VideoLibrary>(),
  MapType<VideoResponse, Video>(
    fields: [
      Field('isFlagged', custom: Mappr.convertFlagsToIsFlagged),
    ],
  ),
])
class Mappr extends $Mappr {
  static bool convertFlagsToIsFlagged(VideoResponse response) {
    return response.flags == 1;
  }

  static UserRole convertUserRole(dynamic source) {
    final String role;
    if (source is UserResponse) {
      role = source.role;
    } else if (source is RegisterResponse) {
      role = source.role ?? '';
    } else if (source is LoginResponse) {
      role = source.user.role;
    } else {
      throw Exception('Unknown source type for role conversion');
    }

    switch (role.toLowerCase()) {
      case 'client':
        return UserRole.CLIENT;
      case 'practitioner':
        return UserRole.PRACTITIONER;
      case 'manager':
        return UserRole.MANAGER;
      case 'staff':
        return UserRole.STAFF;
      case 'admin':
        return UserRole.ADMIN;
      default:
        throw Exception('unknown user role → ${role}');
    }
  }

  static String convertNullableString(dynamic response) {
    return response == null ? '' : response as String;
  }

  static BlogPostStatus convertPostStatus(BlogPostResponse response) {
    switch (response.status.toLowerCase()) {
      case "archived":
        return BlogPostStatus.archived;
      case 'draft':
        return BlogPostStatus.draft;
      case 'published':
        return BlogPostStatus.published;
      default:
        throw Exception('unknown blog status → ${response.status}');
    }
  }
}
